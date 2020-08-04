class UsersprojectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def find_dev?
  	user_is_owner_of_record?
  end
  def user_is_owner_of_record?
	  	user= @record.user
	end

	def check_developer?
			user.check_developer
	end

end
