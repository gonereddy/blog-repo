class CreateNewsLetters < ActiveRecord::Migration
  def change
    create_table :news_letters do |t|
    	t.string :email
      t.timestamps
    end
  end
end
