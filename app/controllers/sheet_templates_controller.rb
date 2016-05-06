class SheetTemplatesController < ApplicationController
  def show
    @sheet = SheetTemplate.find(params.fetch(:id))
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
end
