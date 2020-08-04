class ProjectPolicy < ApplicationPolicy

	  def create?
	    user.projectmanager?
	  end

	  def update?
	  	user.projectmanager?
	  end

	  def dev?
	  	user.developer?
	  end
	  def qa?
	  	user.qa?
	  end
	  def pm?
	  	user.projectmanager?
	  end

	  def find_dev?
	  	user_is_owner_of_record? && user.developer? 

	  	# project.find(params[:id])
	  end

		def check_developer?
			Project.check_developer
		end

	  def developer_show?
	  	user_is_owner_of_record?
	  end

	  def user_is_owner_of_record?
	  	user= @record.user
	  end
end

# Usersproject.find(2).users