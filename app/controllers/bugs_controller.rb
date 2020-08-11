class BugsController < ApplicationController
  respond_to :html, :xml

  before_action :configure_permitted_parameters, if: :devise_controller?
  

	def create
    	@project = Project.find(params[:project_id])
    	@bug = @project.bugs.create(bug_params)
      @bug.update(creator_bug_id: current_user.id)

    if @project.save
      flash.now[:notice] = "We have exactly books available."
      redirect_to project_path(@project)
    else

      render 'new'
    end

  end

 	def destroy
    	@bug = Bug.find(params[:id])
    	@bug.destroy
    	redirect_to project_url(@bug.project_id)
  end

  def assign_bug_developer
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:bug_id])
    @bug.update(user_bug_id: current_user.id)
    @bug.update(project_bug_status: 'started')
    render 'assignment_bug_developer'

  end

  def remove_bug_developer
    @project = Project.find(params[:project_id])

    @bug = Bug.find(params[:bug_id])
    @bug.update(user_bug_id: nil)
    @bug.update(project_bug_status: 'new') 
    render 'assignment_bug_developer'
  end

  def assign_status_to_project
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:bug_id])
    @bug.update(project_bug_status: 'completed')
    redirect_to project_path(@project)

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
  # def project_assignment_try
  #    @project = Project.find(params[:project_id])
  #   @bug = Bug.find(params[:id])
  #   render 'assignment_bug_developer'
  # end

  # def assignment_bug_developer
  #   @project = Project.find(params[:project_id])
  #   @bug = Bug.find(params[:id])
  #   render 'assignment_bug_developer'
  # end


  private
    def bug_params
      params.require(:bug).permit(:title, :body, :image,:bug_type,:project_bug_status,:deadline)
    end
end