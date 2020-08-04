class AddUserBugIdToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :user_bug_id, :integer
  end
end
