class AdamVideo < AdamAsset

  def entity
    data, properties = super
    properties.merge(
        {
            video_duration: data['properties']['VideoDuration'],
            video_mp4: data['renditions']['video_mp4'].first['href'],
            video_webm: data['renditions']['video_webm'].first['href']
        }
    )
  end
  
  #video_mp4 and content_type are used for VideoWidget
  def video_mp4
    entity[:video_mp4]
  end

  def content_type
    url = URI.parse(entity[:video_mp4])
    Net::HTTP.start(url.host, url.port) do |http|
      return http.head(url.request_uri)['Content-Type']
    end
  end
end
