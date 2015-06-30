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
end
