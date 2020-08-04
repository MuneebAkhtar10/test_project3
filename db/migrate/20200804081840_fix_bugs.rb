class FixBugs < ActiveRecord::Migration[6.0]
  def change
  	rename_column :bugs, :user_id, :userbug
  end
end
