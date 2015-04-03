class ProjectsController < ApplicationController
  before_action :set_projects, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end
  
  def show
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params.require(:project).permit(:name, :deadline))
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @project.update(params.require(:project).permit(:name, :deadline, :completed))
    redirect_to @project
  end
  
  def destroy
  end
  
  private
  
  def set_projects
    @project = Project.find(params[:id])
  end  
  
end
