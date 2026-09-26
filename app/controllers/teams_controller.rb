class TeamsController < ApplicationRecord
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    18.times { @team.players.build }
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'チームと選手情報を登録しました。'
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, players_attributes: [:id, :number, :name, :position, :is_starter])
  end
end
