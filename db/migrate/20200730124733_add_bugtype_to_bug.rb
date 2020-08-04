class AddBugtypeToBug < ActiveRecord::Migration[6.0]
  def change
  	add_column :bugs, :type, :integer
    add_column :bugs, :projectstatus, :integer
  end
end
