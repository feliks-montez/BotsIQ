class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @team_id = params[:team_id]
    @users = Team.find(@team_id).users.all
  end

  def show
  end

  def new
    @team = Team.find(params[:team_id])
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(params[:team_id], @user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(params[:team_id], @user)
    else
      render 'create'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      parmas = params.require(:user).permit(:name, :team_id, :position_id, :email, :password, :password_confirmation)
    end
end
