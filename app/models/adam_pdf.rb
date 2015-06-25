class AdamPdf < AdamAsset

  def entity
    super.second
  end

  # def file_to_download
  #   entity[:download_original]
  # end
end
