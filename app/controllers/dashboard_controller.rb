class DashboardController < ApplicationController

  before_action :require_login

  def index
    @user = current_user
    @characters = @user.characters
    @session = @user.players.first.game_session
    @friends = @user.my_friends
    @pending = @user.my_pending_friends
  end
end
