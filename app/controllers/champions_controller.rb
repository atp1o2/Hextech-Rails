class ChampionsController < ApplicationController
  before_action :set_champion, only: [:show, :update, :destroy]

  # GET /champions
  def index
    @champions = Champion.all
    json_response(@champions)
  end

  # POST /champions
  # create! raises an exception ActiveRecord:RecordInvalid
  # Avoids deep nested IF statements in the controller
  # Calls on ExceptionHandler module
  def create
    @champion = Champion.create!(champion_params)
    json_response(@champion, :created)
  end

  # GET /champions/:id
  def show
    json_response(@champion)
  end

  # PUT /champions/:id
  def update
    @champion.update(champion_params)
    head :no_content
  end

  # DELETE /champions/:id
  def destroy
    @champion.destroy
    head :no_content
  end

  private

  def champion_params
    # whitelist params
    params.permit(:name)
  end

  def set_champion
    @champion = Champion.find(params[:id])
  end
end
