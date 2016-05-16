class GameSessionsController < ApplicationController

  before_action :require_login

  def show
    @game = get_game
    @characters = @game.actors
    @players = @game.players
    @sheet =  @game.sheet_template
    @npcs = @game.npcs
    @character = Character.new
    @equip = Equipment.new
    @equipment = Equipment.all
  end

  def new
    @game = GameSession.new
  end

  def create
    @game = current_user.game_sessions.build(game_params)
    @game.game_time = Chronic.parse(params[:game_sessions][:game_time])
    if @game.game_time
      if @game.save
        @game.game_setup(current_user)
        respond_to do |format|
          format.json do
            render json: { message: "Game created!", redirect_id: @game.id }
          end
        end
      end
    else
      render json: "Invalid time", status: :unprocessable_entity
    end
  end

  private
  def get_game
    GameSession.find(params.fetch(:id))
  end

  def game_params
    params.require(:game_sessions).permit(:session_name, :user_id, :sheet_template_id, :game_time)
  end
end
