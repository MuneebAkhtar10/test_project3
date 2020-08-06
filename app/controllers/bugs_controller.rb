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
    @bug = Bug.find(params[:bug_id])
    @bug.update(user_bug_id: current_user.id)
    # redirect_to  '_bug'
    render 'assignment_bug_developer'

  end

  def remove_bug_developer
    @project = Project.find(params[:project_id])

    @bug = Bug.find(params[:bug_id])
    @bug.update(user_bug_id: nil) 
    # redirect_to  '_bug'
    render 'assignment_bug_developer'
  end

  def assign_status_to_project
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:bug_id])
    @bugstatus = Bug.where(:project_bug_status => params[:project_bug_status])
    # @bugstatus = Bug.find(params[:project_bug_status])
    @bug.update(project_bug_status: @bugstatus)
    # redirect_to  '_bug'
    render 'assignment_bug_developer'

  end

  def edit

  end

  def update

  end

  def show
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:id])
    render 'assignment_bug_developer'
  end

  def new_bug
    @project = Project.find(params[:project_id])
    redirect_to 'bugs/_form'
  end

  private
    def bug_params
      params.require(:bug).permit(:title, :body, :image,:bug_type,:project_bug_status)
    end
end