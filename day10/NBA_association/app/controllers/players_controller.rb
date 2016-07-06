class PlayersController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    render_players
  end
  def create
    # render text: params[:first_name]
    players = Player.where("first_name = ?", params[:player][:first_name])
    # render :json => players
    players.each do |player|
      if player.last_name == params[:player][:last_name]
        render :json => ['has already been taken']
      else
        Player.create(player_params)
        render_players
      end
    end
  end
  def destroy
    Player.find(params[:id]).destroy
    render_players
  end

  private
    def render_players
      render :json => Team.select("*").joins(:players)
    end
    def player_params
      params.require(:player).permit(:first_name, :last_name, :team_id)
    end
end
