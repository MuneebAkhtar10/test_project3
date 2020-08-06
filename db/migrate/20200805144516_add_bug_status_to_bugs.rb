class AddBugStatusToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :bug_type, :string
    add_column :bugs, :project_bug_status, :string
  end
end
