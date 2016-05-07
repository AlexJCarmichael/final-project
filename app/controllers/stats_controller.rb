class StatsController < ApplicationController

  def update
    stat = Stat.find(params.fetch(:id))
    stat.update(stat_params)
    render json: { message: "Stat updated"}
  end

  def create
    sheet = params.fetch(:sheet)
    @stat = Stat.new(stat_params)
    if @stat.save
      respond_to do |format|
        format.html do
          redirect_to stat_session_path
        end
        format.json do
          SheetStat.create!( stat_id: @stat.id, sheet_template_id: sheet )
          render json: { message: "Sheet Stat created!", redirect_id: sheet }
        end
      end
    end
  end

  private
  def stat_params
    params.require(:stats).permit(:name, :rank)
  end
end
