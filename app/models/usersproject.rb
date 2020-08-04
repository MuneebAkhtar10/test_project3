class Usersproject < ApplicationRecord
	belongs_to :user
	belongs_to :project

	scope :check, -> {where("user_id =?", current_user.id)}

	# scope :serch_developers, -> {joins(:comments).merge(Comment.null_comment_check)}
end