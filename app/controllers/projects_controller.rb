class ProjectsController < ApplicationController
	before_action :authenticate_user! , except: [:show , :index]
	respond_to :html, :xml
	# after_action :verify_authorized, except: :index
	# after_action :verify_policy_scoped, only: :index 
	def index
    @projects = Project.all
  end

	def new
		  @project = Project.new
		  authorize @project
		  respond_with @projects
  end


  def add_developer
  
  	@user = User.find(params[:user_id])
  	@users = User.where(user_type: :developer)
  	@project = Project.find(params[:id])
  	@project.users<< @user
  	render 'assign_project_to_developer'
  end

  def  remove_developer
  
  	@user = User.find(params[:user_id])
  	@users = User.where(user_type: :developer)
  	@project = Project.find(params[:id])
  	userproject = Usersproject.find_by(user_id: @user.id, project_id: @project.id)
    userproject.destroy if userproject
    render 'assign_project_to_developer'

  end

  def assign_project_to_developer
  	
		@users = User.where(user_type: :developer)
		@project = Project.find(params[:id])
    render 'assign_project_to_developer'
	end

  def create
  	@project = Project.new(project_params)
  	authorize @project
  	@project.user= current_user

  	if @project.save
    	redirect_to @project
  	else
    	render 'new'
  	end
  end
  def new_form

  end
	def show
    @project = Project.find(params[:id])
    respond_with @projects
  end
  def edit
  	@project = Project.find(params[:id])
  	respond_with @projects
	end

	def update
  	@project = Project.find(params[:id])
  	authorize @project
  	if @project.update(project_params)
    	redirect_to @project
  	else
    	render 'edit'
  	end
	end

	def destroy
    @project = Project.find(params[:id])
    @project.destroy
 
    redirect_to projects_path
  end

	private
	def set_project
		@project = Project.find(params[:id])
		authorize @project

	end
  def project_params
    params.require(:project).permit(:title, :body)
  end
end