module PostsHelper
  def self.decode_image(image_param)
    decoded_data = Base64.decode64(image_param[:imageData])

    data = StringIO.new(decoded_data)

    data.class_eval do
      attr_accessor :content_type, :original_filename
    end

    data.content_type = image_param[:imageContent]
    data.original_filename = image_param[:imagePath]
    data
  end
end
