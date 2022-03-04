# frozen_string_literal: true

# spec/models/place_status.rb

require 'rails_helper'

RSpec.describe PlaceStatus, type: :model do
  describe '#create' do
    subject(:create_place_status) { PlaceStatus.new(name: status_name) }
    STATUSES = %i[available booked assigned not_available paid_in_advance].freeze

    context 'when name field is valid' do
      STATUSES.each do |status|
        let(:status_name) { status }

        it "create valid PlaceStatus with #{status} value" do
          expect(create_place_status.save).to be_truthy
        end
      end
    end

    context 'when name field is invalid' do
      let(:status_name) { :invalid_name }

      it 'PlaceStatus does not created' do
        expect { create_place_status }.to raise_error(ArgumentError)
      end
    end

    context 'when PlaceStatus have already exist' do
      let(:status_name) { STATUSES[0] }

      before { PlaceStatus.create(name: status_name) }

      it 'new PlaceStatus does not created' do
        expect { create_place_status.save }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
