class GameSessionsController < ApplicationController

  def show
    @game = get_game
    @characters = @game.actors
    @players = @game.players
    @sheet =  @game.sheet_template
    @npcs = @game.npcs
    @character = Character.new
  end

  def new
    @game = GameSession.new
  end

  def create
    @game = current_user.game_sessions.build(game_params)
    if @game.save
      @game.game_setup(current_user)
      respond_to do |format|
        format.json do
          render json: { message: "Game created!", redirect_id: @game.id }
        end
      end
    end
  end

  private
  def get_game
    GameSession.find(params.fetch(:id))
  end

  def game_params
    params.require(:game_sessions).permit(:session_name, :user_id, :sheet_template_id)
  end
end
