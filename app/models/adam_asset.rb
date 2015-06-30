class AdamAsset < Obj
  include Api
  
  attribute :adam_id, :string
  attribute :file_type, :string

  def entity
    data = get_entity_from_adam adam_id
    properties = {
        title: data['properties']['Title'],
        file_name: data['properties']['FileName'],
        file_size: data['properties']['FileSize'],
        file_type: data['properties']['FileType'],
        created_on: data['created_on'],
        modified_on: data['modified_on'],
        preview: data['renditions']['preview'].first['href'],
        thumbnail: data['renditions']['thumbnail'].first['href'],
        download_original: data['renditions']['downloadOriginal'].first['href']
    }
    
    return data, properties
  end

  def display_title
    entity[:title].presence || "<untitled #{obj_class_name}>"
  end
  
  def self.find_by_adam_id(id)
    Obj.where(:adam_id, :equals, id).first
  end

  def file_type
    entity[:file_type]
  end

  # thumbnail is used for content browser preview and scrivito_image_tag
  def thumbnail
    entity[:thumbnail]
  end

  # preview is used for scrivito_image_tag and video poster
  def preview
    entity[:preview]
  end
  
  # file_size and download_original are used for LinksWidget
  def download_original
    entity[:download_original]
  end

  def file_size
    entity[:file_size]
  end
end
