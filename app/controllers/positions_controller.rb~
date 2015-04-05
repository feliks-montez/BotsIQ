class PositionsController < ApplicationController
  before_action :set_position, only: [:edit, :update, :destroy]

  def index
    @team = Team.find(params[:team_id])
    @positions = @team.positions.all
  end
  
  def new
    @team_id = params[:team_id]
    @position = Position.new
  end
  
  def create
    @team = Team.find(params[:team_id])
    @position = Position.new(position_params)
    @position.team = @team
    if @position.save
      @team.positions.append(@position)
      if @team.save
        redirect_to @team
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @position = Position.update(position_params)
    redirect_to team_path(params[:team_id])
  end
  
  def destroy
  end
  
  private
  
  def set_position
    @position = Position.find(params[:id])
  end
  
  def position_params
    params.require(:position).permit(:name, :team_id)
  end

end
