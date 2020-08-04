class BugDeveloper < ApplicationRecord
	belongs_to :user
	belongs_to :project
	belongs_to :bugs
end
