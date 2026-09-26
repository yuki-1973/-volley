class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    18.times { @team.players.build }
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: "チームを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # 未入力枠も含めて18名分揃える処理
    remaining_players = 18 - @team.players.size
    remaining_players.times { @team.players.build } if remaining_players > 0
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "チーム情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "チームを削除しました"
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, players_attributes: [:id, :number, :name, :position, :starter, :_destroy])
  end
end
