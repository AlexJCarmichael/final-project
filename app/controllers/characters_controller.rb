class CharactersController < ApplicationController
  def show
    get_character
  end

  def new
    @player = current_user.players.first
    @game = GameSession.find(params.fetch(:session_id))
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(char_params)
      if @character.save!
        redirect_to game_session_path(@character.player.game_session_id)
      else
        flash[:alert] = "Character could not be created"
      end
  end

  private
  def get_character
    @character = Character.find(params.fetch(:id))
  end

  def char_params
    params.require(:character).permit(:name, :sheet_template_id, :bio, :player_id)
  end
end
