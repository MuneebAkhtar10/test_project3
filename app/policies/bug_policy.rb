class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def dev?
	  user.developer?
	end

	# def images?
	# 	Bug.image_check
	# end
end
