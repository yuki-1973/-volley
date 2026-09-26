class TeamsController < ApplicationController
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
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, players_attributes: [:id, :number, :name, :position, :starter, :_destroy])
  end
end
