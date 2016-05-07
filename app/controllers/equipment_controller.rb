class EquipmentController < ApplicationController
  def character
    game = GameSession.first
    @items = game.items
    render json: @items
  end

  def charequip
    CharEquip.create(character_id: params.fetch(:char_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end
end
