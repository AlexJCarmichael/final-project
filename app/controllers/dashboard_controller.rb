class DashboardController < ApplicationController
  
  before_action :require_login

  def index
    @user = current_user
    @characters = @user.characters
    @session = @user.game_sessions.first
    @friends = @user.friendships
    @pending = @user.pending_friendships
  end
end
