class BugsController < ApplicationController
  respond_to :html, :xml

  before_action :configure_permitted_parameters, if: :devise_controller?
  

	def create
    	@project = Project.find(params[:project_id])
    	@bug = @project.bugs.create(bug_params)
    	redirect_to project_path(@project)
  end
 	def destroy
    	@bug = Bug.find(params[:id])
    	@bug.destroy
    	redirect_to project_url(@bug.project_id)
  end


  # def take_bug_developer
  #   byebug
  #   @project = Project.find(params[:project_id])
  #   @users = User.where(user_type: :developer)
  #   # user = Bug.find(params[:userbug])
  #   @bug = Bug.find(params[:id])
  #   @bug.user<< @user
  #   render 'index'
  # end


  def assign_bug_developer
    @project = Project.find(params[:project_id])
    # @users = User.find(params[:userbug])
    # user = Bug.find(params[:userbug])
    @bug = Bug.find(params[:bug_id])
    @bug.update(user_bug_id: current_user.id) 
    render 'assign_bug_developer'
  end

  def remove_bug_developer
    @project = Project.find(params[:project_id])
    # @users = User.find(params[:userbug])
    # user = Bug.find(params[:userbug])
    @bug = Bug.find(params[:bug_id])
    userbug= Bug.find_by(user_bug_id: @userbug, bug_id: bug.id)
    userbug.destroy if userbug
    render 'assign_bug_developer'
  end

  def new_bug
    render 'bugs/_form'
  end
 #  def assign_developer
 #  	  @bug.user= user
 #  	  render 'index'
 #  end

	# def assign_bug_to_developer
	# 	@users = User.where(user_type: :developer)
 #    render 'assign_bug_to_developer'
	# end

  private
    def bug_params
      params.require(:bug).permit(:title, :body, :image)
    end
end