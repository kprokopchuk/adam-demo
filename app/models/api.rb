module Api
  ADAM_OBJ_CLASSES = %w(
      AdamImage
      AdamPdf
      AdamVideo
  )

  def get_entity_from_adam(id)
    authenticate unless @token #todo
    
    uri = URI.parse("http://demo.oew.de/api/entities/#{id}")

    request = Net::HTTP::Get.new(uri.request_uri)
    request['X-Auth-Token'] = @token

    response = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(request)
    }

    JSON.parse(response.body)
  end
  
  def get_class_by_file_type(obj)
    file_type = obj['properties']['FileType']

    obj_class = case file_type
                  when "MP4"
                    "AdamVideo"
                  when "PDF"
                    "AdamPdf"
                  else
                    if %w(JPG PNG).include? file_type
                      "AdamImage"
                    end
                end
    
    return obj_class, file_type
  end

  private

  def authenticate
    uri = URI.parse('http://demo.oew.de/api/authenticate')

    request = Net::HTTP::Post.new(uri.request_uri)
    request.content_type = "application/json"
    request.body = {
        user_name: ENV['ADAM_USER_NAME'] || adam_config["user_name"],
        password: ENV['ADAM_PASSWORD'] || adam_config["password"]
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(request)
    }

    @token = JSON.parse(response.body)['token']
  end

  def adam_config
    YAML.load_file(Rails.root + 'config/adam.yml') || {}
  rescue Errno::ENOENT
    {}
  end
end
