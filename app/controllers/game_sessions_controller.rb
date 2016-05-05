class GameSessionsController < ApplicationController

  def show
    @game = get_game
    @characters = @game.characters
    @players = @game.players
  end

  def new
    @game = GameSession.new
  end

  def create
    @game = current_user.game_sessions.build(game_params)
    if @game.save
      respond_to do |format|
        format.html do
          redirect_to game_session_path
        end
        format.json do
          Player.create!( user_id: current_user.id, game_session_id: @game.id )
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
