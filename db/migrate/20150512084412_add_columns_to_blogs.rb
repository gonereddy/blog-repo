class AddColumnsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :author, :string
    add_column :blogs, :link, :string
  end
end
