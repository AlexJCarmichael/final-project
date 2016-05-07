class EquipmentController < ApplicationController
  def session
    binding.pry
    game = GameSession.find(params.fetch(:id))
    @items = game.items
    render json: @items
  end
end
