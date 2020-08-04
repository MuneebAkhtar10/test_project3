class Bug < ApplicationRecord
  belongs_to :project
  has_one_attached :image
  has_many :users ,through: :usersprojects
  # 
  # has_many :bug_developer, dependent: :destroy
  # has_many :users ,through: :bug_developer

  enum type:[:Bug,:Feature]
	enum projectstatus:[:New,:Started,:Completed]

	scope:image_check , -> {where("image <> '' ")}
end
