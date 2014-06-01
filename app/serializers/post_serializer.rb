class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :excerpt, :date, :image_file_name
  root false
end