class AddSubscribedToNewsletter < ActiveRecord::Migration
  def change
  	add_column :news_letters, :subscribed, :boolean, default: false
  end
end
