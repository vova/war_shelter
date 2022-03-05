require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(limit: 100, null: false) }
    it { is_expected.to have_db_column(:accomodation_type_id).of_type(:integer) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:region).of_type(:string) }
    it { is_expected.to have_db_column(:rooms_available).of_type(:integer) }
    it { is_expected.to have_db_column(:beds).of_type(:integer) }
    it { is_expected.to have_db_column(:kids_beds).of_type(:integer) }
    it { is_expected.to have_db_column(:is_pets_allowed).of_type(:boolean) }
    it { is_expected.to have_db_column(:capacity).of_type(:integer).with_options(default: 2, null: false) }
    it { is_expected.to have_db_column(:additional_child_place).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:coordinator_id).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:price_per_day).of_type(:integer) }
    it { is_expected.to have_db_column(:price_per_month).of_type(:integer) }
    it { is_expected.to have_db_column(:is_price_in_dollars).of_type(:boolean) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:distance_from_center).of_type(:integer) }
    it { is_expected.to have_db_column(:available_since).of_type(:datetime) }
    it { is_expected.to have_db_column(:available_till).of_type(:datetime) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:phone2).of_type(:string) }
    it { is_expected.to have_db_column(:is_realtor).of_type(:boolean) }
    it { is_expected.to have_db_column(:contact_name).of_type(:string) }
    it { is_expected.to have_db_column(:geo).of_type(:string) }
    it { is_expected.to have_db_column(:website).of_type(:string) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
    it { is_expected.to have_db_column(:floor).of_type(:string) }
    it { is_expected.to have_db_column(:is_newbuilding).of_type(:boolean) }
  end

  describe 'status column' do
    subject(:create_place_with_status) { FactoryBot.build(:place, status: status_name) }
    STATUSES = %i[available booked assigned not_available paid_in_advance].freeze

    context 'when status is valid' do
      STATUSES.each do |status|
        let(:status_name) { status }

        it "create valid Place with status #{status}" do
          expect(create_place_with_status.save).to be_truthy
        end
      end
    end

    context 'when status is invalid' do
      let(:status_name) { :invalid_name }

      it 'Place does not created' do
        expect { create_place_with_status }.to raise_error(ArgumentError)
      end
    end

    context 'when status is not present' do
      before { FactoryBot.create(:place)  }

      it 'create valid Place with default value' do
        expect(Place.last.available?).to be_truthy
      end
    end
  end
end
