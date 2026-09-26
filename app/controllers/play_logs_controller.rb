class PlayLogsController < ApplicationController
  before_action :set_match

  def create
    @play_log = @match.play_logs.build(play_log_params)
    if @play_log.save
      redirect_to team_match_path(@match.team, @match, set_number: @play_log.set_number), notice: "記録完了"
    else
      redirect_to team_match_path(@match.team, @match), alert: "記録に失敗しました"
    end
  end

  def destroy
    @play_log = @match.play_logs.find(params[:id])
    set_num = @play_log.set_number
    @play_log.destroy
    redirect_to team_match_path(@match.team, @match, set_number: set_num), notice: "削除しました"
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def play_log_params
    params.require(:play_log).permit(:player_id, :set_number, :action_type, :result, :team_type, :eval_detail, :start_x, :start_y, :end_x, :end_y)
  end
end
