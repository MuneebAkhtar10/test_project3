class Project < ApplicationRecord
  validates_associated :bugs
	validates :title, presence: true,uniqueness: true ,
                    length: { minimum: 5}

	scope :check_developer, -> {joins(:usersprojects).where(:user_id, current_user.id)}

  belongs_to :user
  has_many :usersprojects, dependent: :destroy

  # has_many :bug_developers, dependent: :destroy
  # has_many :bugs ,through: :bug_developers

  has_many :bugs, dependent: :destroy
  has_many :users, through: :usersprojects

end
