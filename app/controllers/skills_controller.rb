class SkillsController < ApplicationController

  def update
    skill = Skill.find(params.fetch(:id))
    skill.update(skill_params)
    render json: { message: "Skill updated"}
  end

  def create
    sheet = params.fetch(:sheet)
    @skill = Skill.new(skill_params)
    if @skill.save
      respond_to do |format|
        format.html do
          redirect_to skill_session_path
        end
        format.json do
          SheetSkill.create!( skill_id: @skill.id, sheet_template_id: sheet )
          render json: { message: "Sheet Skill created!", redirect_id: sheet }
        end
      end
    end
  end

  private
  def skill_params
    params.require(:skills).permit(:name, :rank)
  end
end
