class DashboardController < ApplicationController
  def index
    @user = current_user
    @characters = @user.characters
    @session = @user.game_sessions.first
  end
end
