class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.text :excerpt
      t.attachment :image
      t.timestamps
    end
  end
end
