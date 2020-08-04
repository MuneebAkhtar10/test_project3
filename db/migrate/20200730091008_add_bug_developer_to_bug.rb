class AddBugDeveloperToBug < ActiveRecord::Migration[6.0]
  def change
  	create_table :bug_projects do |t|

	  	t.references :user, foreign_key: true
	  	t.references :project, foreign_key: true
	  	t.references :bug, foreign_key: true
      t.timestamps

  	end
  end
end
