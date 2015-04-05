class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params.require(:team).permit(:name))
    if @team.save
      @captain = User.new(name: params[:captain_name], email: params[:captain_email], password: params[:captain_password], password_confirmation: params[:captain_confirm_password], team_id: @team.id)
      @position = Position.new(name: "Captain", team_id: @team.id)
      @captain.position = @position
      if @position.save and @captain.save
        sign_in @captain
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
    @team.update(params.require(:team).permit(:name))
    redirect_to @team
  end
  
  def destroy
  end
  
  private
  
  def set_team
    @team = Team.find(params[:id])
  end
end
