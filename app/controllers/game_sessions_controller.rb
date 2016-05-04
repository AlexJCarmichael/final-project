class GameSessionsController < ApplicationController
  def new
    @game = GameSession.new
  end

  def create
    @game = current_user.messages.build(game_params)
    if @game.save
      respond_to do |format|
        format.html do
          redirect_to game_session_path
        end
        format.json do
          render json: { message: "Game created!" }
        end
      end
    end
  end

  private
  def get_game
    @game = GameSession.find(params.fetch(:id))
  end

  def game_params
    params.require(:game_session).permit(:body, :user_id)
  end
end
