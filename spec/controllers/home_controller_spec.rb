# frozen_string_literal: true

RSpec.describe HomeController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(ApplicationController)
  end

  let(:user) { create(:user) }
  let(:place) { create(:place, coordinator_id: AdminUser.first.id, accommodation_type_id: AccommodationType.first.id) }
  let(:place_available) do
    create(
      :place,
      coordinator_id: AdminUser.first.id,
      accommodation_type_id: AccommodationType.first.id,
      city: user.destination
    )
  end

  describe '#index' do
    before do
      user
      sign_in user
      get :index
    end

    context 'when user destination and place name are different' do
      before do
        place
      end

      it 'returns available places with empty array' do
        expect(Place.available_places_for(user)).to eq([])
      end
    end

    context 'when user destination and place city are the same' do
      before do
        place_available
      end

      it 'returns available places array with object' do
        expect(Place.available_places_for(user).size).to eq(1)
      end
    end
  end

  describe '#show' do
    before do
      user
      place_available
      sign_in user
      get :show, params: params
    end

    context 'when placeId is valid for available places' do
      let(:params) { { id: place_available.id } }

      it 'returns place available with correct id' do
        expect(Place.available_places_for(user).pluck(:id)).to include(params[:id])
      end
    end

    context 'when placeId is invalid for available places' do
      let(:params) { { id: SecureRandom.uuid } }

      it 'raise error' do
        expect(flash[:alert]).to include(I18n.t('place_is_not_available'))
      end
    end
  end
end