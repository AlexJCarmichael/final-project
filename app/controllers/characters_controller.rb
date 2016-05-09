class CharactersController < ApplicationController
  def show
    @character = get_character
    respond_to do |format|
      format.html { }
      format.pdf do
        render pdf: 'event-report', disable_external_links: true, template: 'characters/show.html.erb'
      end
    end
  end

  def new
    @game = GameSession.find(params.fetch(:session_id))
    @player = current_user.players.where(game_session_id: @game.id).first
    @character = Character.new
  end

  def edit
    get_character
  end

  def create
    character = current_user.characters.build(char_params)
      if character.save!
        assign_defaults(character)
        redirect_to character_path(character)
      else
        flash[:alert] = "Character could not be created"
      end
  end

  private
  def get_character
    Character.find(params.fetch(:id))
  end

  def char_params
    params.require(:character).permit(:name, :sheet_template_id, :bio, :player_id)
  end

  def assign_defaults(character)
    sheet = SheetTemplate.find(character.sheet_template_id)

    char_skills = sheet.skills.map { |skl| Skill.create(name: skl.name) }
    char_skills.map do |skill|
      CharSkill.create(skill_id: skill.id, character_id: character.id)
    end

    char_stats = sheet.stats.map { |st| Stat.create( name: st.name )}
    char_stats.map { |stat| CharStat.create( stat_id: stat.id, character_id: character.id ) }
  end
end
