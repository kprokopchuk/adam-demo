class AdamImage < AdamAsset

  def entity
    data, properties = super
    properties.merge(
        {
            image_width: data['properties']['ImageWidth'],
            image_height: data['properties']['ImageHeight'],
            color_space: data['properties']['ColorSpace']
        }
    )
  end

  # preview and thumbnail are used for scrivito_image_tag
  def preview
    entity[:preview]
  end

  def thumbnail
    entity[:thumbnail]
  end
end
