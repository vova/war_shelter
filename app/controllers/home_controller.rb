# frozen_string_literal: true

# Provides the home endpoints
class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_available_places, only: %i[index show]

  def index; end

  def show
    if @available_places.pluck(:id).include?(params[:id].to_i)
      @place = Place.find(params[:id])
    else
      flash.now.alert = I18n.t('controllers.place_is_not_available')
      render :index
    end
  end

  private

  def set_available_places
    @available_places = Place.available_places_for(
      current_user
    ).includes(
      :coordinator, :accommodation_type, :user, :region
    )
  end
end
