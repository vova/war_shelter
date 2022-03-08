class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @available_places = Place.available_places_for(
      current_user
    ).includes(
      :coordinator, :accommodation_type, :user
    )
  end
end
