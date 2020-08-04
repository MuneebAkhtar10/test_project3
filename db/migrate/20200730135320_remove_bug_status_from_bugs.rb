class RemoveBugStatusFromBugs < ActiveRecord::Migration[6.0]
  def change
    remove_column :bugs, :status, :boolean

  end
end
