class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_team
  
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end
  
  def sign_out
    session[:user_id] = nil
  end
  
  def set_team
    if params[:team_id]
      @team = Team.find(params[:team_id])
    end
  end
end
