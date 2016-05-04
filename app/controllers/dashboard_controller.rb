class DashboardController < ApplicationController

  before_action :require_login

  def index
    @user = current_user
    @characters = @user.characters
    @sessions = @user.game_sessions
    @friends = @user.my_friends
    @pending = @user.my_pending_friends
  end
end
