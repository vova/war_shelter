class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: %i[show]

  def index
    @available_places = Place.available_places_for(
      current_user
    ).includes(
      :coordinator, :accommodation_type, :user
    )
  end

  def show
    @place
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end
end
