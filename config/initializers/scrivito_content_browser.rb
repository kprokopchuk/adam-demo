# Register a JavaScript search API result format used by the content browser.
Scrivito::Configuration.register_obj_format('content_browser') do |obj, _, view_context|
  has_details_view = view_context.lookup_context.exists?(
      obj.details_view_path, [], false, [], formats: [:html])

  format = {
      id: obj.id,
      file_type: obj.obj_class_name,
      file_size: ConverterHelper.human_binary_length(obj.binary_length),
      last_changed: obj[:_last_changed],
      title: obj.description_for_editor.presence || obj.binary.try(:filename),
      subtitle: obj.info_for_content_browser,
      mime_type: obj.binary_content_type,
      has_details_view: has_details_view
  }

  if Api::ADAM_OBJ_CLASSES.include?(obj.obj_class_name)
    format[:preview] = obj.thumbnail
  elsif obj.binary_content_type && obj.binary_content_type.start_with?('image/')
    format[:preview] = obj.binary_url
  end

  format
end

