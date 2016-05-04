class CharactersController < ApplicationController
  def show
    get_character
  end

  def new
    @game = GameSession.find(params.fetch(:session_id))
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(character_params)
  end

  private
  def get_character
    @character = Character.find(params.fetch(:id))
  end

  def char_params
    params.require(:character).permit(:name, :sheet_template_id, :bio, :player_id)
  end
end
