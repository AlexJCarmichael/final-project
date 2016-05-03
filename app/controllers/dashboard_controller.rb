class DashboardController < ApplicationController
  def index
    @user = current_user
    @character = @user.characters.first
    @session = @user.game_sessions.first
  end
end
