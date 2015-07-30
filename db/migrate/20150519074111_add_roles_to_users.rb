class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :boolean, default: false
    add_column :users, :super_admin, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
    add_column :users, :guest, :boolean, default: true
  end
end
