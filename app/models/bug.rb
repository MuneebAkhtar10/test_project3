class Bug < ApplicationRecord
  belongs_to :project

  has_one_attached :image
  validates :title, presence: true,uniqueness: true ,
                    length: { minimum: 5}

  validate :image_type                  

  has_many :users ,through: :usersprojects

  enum type:[:Bug,:Feature]
	enum projectstatus:[:New,:Started,:Completed]

	scope:image_check , -> {where("image <> '' ")}

	def image_type
		if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
			errors.add(:image, 'Must be a jgeg pr png')
		end
	end
end
