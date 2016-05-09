class DashboardController < ApplicationController

  before_action :require_login

  def index
    @user = current_user
    @characters = @user.characters
    @sessions = @user.my_games
    @friends = @user.my_friends
    @pending = Friend.where("user_id = ? or to_user_id = ? and status = ?", @user.id, @user.id, Friend::PENDING)
  end
end
