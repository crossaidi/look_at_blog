class PostSerializer < ActiveModel::Serializer
  attributes :result, :id, :name, :body, :excerpt, :date, :image_file_name

  root false

  def result
    1
  end
end