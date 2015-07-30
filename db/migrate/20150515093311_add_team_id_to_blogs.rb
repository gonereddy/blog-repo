class AddTeamIdToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :team, index: true
  end
end
