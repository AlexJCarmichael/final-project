class SheetTemplatesController < ApplicationController
  def show
    @sheet = SheetTemplate.find(params.fetch(:id))
  end

  def new
    @game_id = params.fetch(:game)
  end

  def create
    sheet = SheetTemplate.create(sheet_params)
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
