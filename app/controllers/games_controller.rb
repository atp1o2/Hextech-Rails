class GamesController < ApplicationController
  before_action :set_champion
  before_action :set_champion_game, only: [:show, :update, :destroy]

  def index
    json_response(@champion.games)
  end

  def show
    json_response(@game)
  end

  def create
    @champion.games.create!(game_params)
    json_response(@champion, :created)
  end

  def destroy
    @game.destroy
    head :no_content
  end

  private

  def game_params
    params.permit(:datePlayed)
  end

  def set_champion
    @champion = Champion.find(params[:champion_id])
  end

  def set_champion_game
    @game = @champion.games.find_by!(champion_id: params[:champion_id]) if @champion
  end
end
