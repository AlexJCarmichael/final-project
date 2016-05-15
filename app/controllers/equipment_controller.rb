class EquipmentController < ApplicationController
  def index
    @items = Equipment.all
    render json: @items
  end

  def create
    equip = Equipment.create(equip_params)
    if equip.id
      SessionItem.create(game_session_id: params.fetch(:equipment).fetch(:game_id), equipment_id: equip.id)
      respond_to do |format|
        format.json do
          render json: "Equipment created"
        end
        format.html do
          redirect_to :back
        end
      end
    else
      render json: "Failed to create equipment", status: :unprocessable_entity
    end
  end

  def character
    game = GameSession.find_by(id: params.fetch(:id))
    @items = game.items
    render json: @items
  end

  def char_equip
    CharEquip.create(character_id: params.fetch(:char_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end

  def game_equip
    SessionItem.create(game_session_id: params.fetch(:game_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end

  private
  def equip_params
    params.require(:equipment).permit(:name, :category, :sub_category, :armor, :damage, :weight, :reach, :effects)
  end
end
