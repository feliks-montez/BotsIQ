class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = @team.projects.all
  end
  
  def new
    @project = Project.new
  end
  
  def show
  end
  
  def create
    @project = @team.projects.new(params.require(:project).permit(:name, :deadline))
    @project.team_id = @team.id
    if @project.save
      redirect_to @team
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @project.update(params.require(:project).permit(:name, :deadline, :completed))
    redirect_to @team
  end
  
  def destroy
  end
  
  private
  
  def set_project
    @project = Project.find(params[:id])
  end  
  
end
