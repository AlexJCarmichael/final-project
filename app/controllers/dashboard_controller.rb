class DashboardController < ApplicationController
  def index
    @character = Character.where("user_id = 1")
  end
end
