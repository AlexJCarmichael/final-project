class CharactersController < ApplicationController
  def show
    get_character
  end

  private
  def get_character
    @character = Character.find(params.fetch(:id))
  end

  def char_params
    params.require(:character).permit(:name, :sheet_template_id, :bio, :player_id)
  end
end
