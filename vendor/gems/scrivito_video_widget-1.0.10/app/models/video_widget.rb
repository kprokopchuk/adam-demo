class VideoWidget < Widget
  attribute :source, :reference
  attribute :poster, :reference

  # Determines the mime type of the video.
  def mime_type
    if source.present?
      case source
        when AdamVideo
          source.try(:content_type)
        else
          source.binary_content_type
      end
    end
  end

  def width
    self[:width].presence || '660'
  end

  def height
    self[:height].presence || '430'
  end

  def source_src
    case source
      when AdamVideo
        source.video_mp4
      else
        source.try(:binary_url)
    end
  end
end