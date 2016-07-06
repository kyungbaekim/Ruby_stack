class TeamsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    render_teams
  end
  def create
    team = Team.new(team_params)
    if !team.save
      render :json => team.errors[:name]
    else
      render_teams
    end
  end
  def destroy
    Team.find(params[:id]).destroy
    render_teams
  end

  private
    def render_teams
      render :json => Team.all
    end
    def team_params
      params.require(:team).permit(:name)
    end
end
