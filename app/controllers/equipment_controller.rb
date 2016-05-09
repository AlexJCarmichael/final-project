class EquipmentController < ApplicationController
  def index
    @items = Equipment.all
    render json: @items
  end

  def new
    @game = params[:game]
    @equip = Equipment.new
  end

  def create
    equip = Equipment.create(equip_params)
    if equip.id
      SessionItem.create(game_session_id: params.fetch(:equipment).fetch(:game_id), equipment_id: equip.id)
      flash[:alert] = "Equipment created"
      redirect_to :back
    else
      flash[:alert] = "Missing a required field"
      redirect_to :back
    end

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
    SessionItem.create(game_session_id: params.fetch(:game_id), equipment_id: params.fetch(:id))
    redirect_to :back
  end

  private
  def equip_params
    params.require(:equipment).permit(:name, :category, :sub_category, :armor, :damage, :weight, :reach, :effects)
  end
end
