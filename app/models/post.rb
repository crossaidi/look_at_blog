class Post < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1, maximum: 250 }
  validates :body, presence: true

  has_attached_file :image

  after_create :add_additional_data

  protected
    def add_additional_data
      self.excerpt = body.truncate(150)
      self.date = DateTime.current()
      self.save
    end
end
