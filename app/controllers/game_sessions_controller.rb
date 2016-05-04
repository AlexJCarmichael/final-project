class GameSessionsController < ApplicationController

  def show
    @game = get_game
    @characters = @game.characters
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
          render json: { message: "Game created!", game_id: @game.id }
        end
      end
    end
  end

  private
  def get_game
    GameSession.find(params.fetch(:id))
  end

  def game_params
    params.require(:game_session).permit(:session_name, :user_id, :sheet_template_id)
  end
end
