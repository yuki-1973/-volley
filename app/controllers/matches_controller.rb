class MatchesController < ApplicationController
  before_action :set_team
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = @team.matches.order(match_date: :desc)
  end

  def new
    @match = @team.matches.build(match_date: Date.today, total_sets: 3)
  end

  def create
    @match = @team.matches.build(match_params)
    if @match.save
      redirect_to team_match_path(@team, @match), notice: "試合を作成しました。入力画面へ進みます。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @match.destroy
    redirect_to team_matches_path(@team), notice: "試合を削除しました"
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_match
    @match = @team.matches.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:opponent_name, :match_date, :total_sets, :status)
  end
end
