class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :details
      t.string :category
      t.string :tags
      t.datetime :post_date
      t.string :blog_video
      t.string :avatar
      t.integer :user_id

      t.timestamps
    end
  end
end
