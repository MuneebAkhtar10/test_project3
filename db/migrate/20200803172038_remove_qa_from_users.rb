class RemoveQaFromUsers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :qa, :integer
  end
end
