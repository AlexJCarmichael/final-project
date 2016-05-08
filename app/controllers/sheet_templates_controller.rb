class SheetTemplatesController < ApplicationController
  def show
    @sheet = SheetTemplate.find(params.fetch(:id))
  end

  def new
    @game_id = params.fetch(:game)
  end

  def create
    sheet = SheetTemplate.create(sheet_params)
    if params.fetch(:sheet_template).fetch(:game_id)
      game = params.fetch(:sheet_template).fetch(:game_id)
      GameSheet.create(sheet_template_id: sheet.id, game_session_id: game)
    end
    render json: { message: "Sheet created!", redirect_id: sheet.id }
  end

  def grabber
    sheet = SheetTemplate.find(params.fetch(:id))
    @skills = sheet.skills
    @stats = sheet.stats
    render json: {
      skills: @skills,
      stats: @stats
      }
  end

  private
  def sheet_params
    params.require(:sheet_template).permit(:game_name)
  end
end
