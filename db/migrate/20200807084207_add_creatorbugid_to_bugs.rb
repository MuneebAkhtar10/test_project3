class AddCreatorbugidToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :creator_bug_id, :integer
  end
end
