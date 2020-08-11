class AddDatesToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :dead, :datetime
  end
end
