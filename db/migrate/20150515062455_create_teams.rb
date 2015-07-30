class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :facebook_link
      t.string :twitter_link
      t.string :googleplus_link
      t.string :linkedin_link
      t.string :email

      t.timestamps
    end
  end
end
