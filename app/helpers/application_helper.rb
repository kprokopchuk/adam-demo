module ApplicationHelper

  def link_url link
    if link.external?
      link.url
    elsif link.internal?
      if link.obj.class.superclass == AdamAsset
        link.obj.download_original
      else
        scrivito_url(link)
      end
    end
  end
  
end
