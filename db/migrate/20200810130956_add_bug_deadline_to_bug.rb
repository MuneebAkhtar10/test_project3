class AddBugDeadlineToBug < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :deadline, :string
  end
end
