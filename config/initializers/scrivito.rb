require 'yaml'

def scrivito_config
  YAML.load_file(Rails.root + 'config/scrivito.yml') || {}
rescue Errno::ENOENT
  {}
end

Scrivito.configure do |config|
  #
  # Uncomment following lines in order to explicitly set the tenant and the API key.
  # If not explicitly set, the tenant and the API key are obtained from the environment variables
  # SCRIVITO_TENANT and SCRIVITO_API_KEY.
  #
  config.tenant  = ENV['SCRIVITO_TENANT'] || scrivito_config['tenant']
  config.api_key = ENV['SCRIVITO_API_KEY'] || scrivito_config['api_key']
  config.ui_locale = :en

  config.editing_auth { |env| Scrivito::User.system_user }
end

Scrivito::ImageTagHelper.class_eval do
  def options(obj, field_name, tag_options, editing_options)
    tag_options.reverse_merge(src: scrivito_image_tag_src(obj, field_name, editing_options, tag_options),
                              alt: scrivito_image_tag_alt(obj, field_name))
  end
  
  def scrivito_image_tag_src(obj, field_name, editing_options, tag_options)
    scrivito_image_tag_path(obj, field_name, tag_options) || editing_options[:placeholder] ||
        view_context.image_path('scrivito/image_placeholder.png')
  end
  
  def scrivito_image_tag_path(obj, field_name, tag_options)
    field_type = obj.type_of_attribute(field_name)
    field_value = obj[field_name]

    case field_type
      when 'link', 'binary', 'reference'
        field_value && case field_value
                         when AdamImage
                           field_value.send(tag_options[:rendition])
                         else
                           view_context.scrivito_path(field_value)
                       end
      when 'linklist'
        path = view_context.scrivito_path(field_value)
        path == CmsRouting::LINK_TO_EMPTY_LINKLIST ? nil : path
    end
  end
end
