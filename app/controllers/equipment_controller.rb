class EquipmentController < ApplicationController
  def character
    game = GameSession.first
    @items = game.items
    render json: @items
  end
end
