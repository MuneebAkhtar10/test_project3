class RemoveTypeColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :qa
  	remove_column :users, :projectmanager
  	remove_column :users, :developer
  end
end