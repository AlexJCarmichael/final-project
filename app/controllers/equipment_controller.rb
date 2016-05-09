class EquipmentController < ApplicationController
  def index
    @items = Equipment.all
    render json: @items
  end

  def new
    @equip = Equipment.new
  end

  def create
  end

  def character
    game = GameSession.first
    @items = game.items
    render json: @items
  end

  def charequip
    CharEquip.create(character_id: params.fetch(:char_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end

  def gameequip
    binding.pry
    SessionItem.create(game_session_id: params.fetch(:game_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end
end
