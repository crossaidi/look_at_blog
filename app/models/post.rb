class Post < ActiveRecord::Base
  default_scope -> { order(date: :desc) }

  has_attached_file :image, styles: { thumb: "250x250#", medium: "300x300#" },\
    path: ':rails_root/public/uploads/:attachment/:style/:filename'

  validates :name, presence: true, length: { minimum: 1, maximum: 250 }
  validates :body, presence: true

  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/png"] }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

  before_save :fill_additional_data

  protected
    def fill_additional_data
      self.excerpt = body.truncate(100)
      self.date = DateTime.current()
    end
end
