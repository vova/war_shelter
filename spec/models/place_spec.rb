require 'rails_helper'
require 'pry'

RSpec.describe Place, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:coordinator){ FactoryBot.create(:admin_user) }

  describe 'table columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(limit: 100, null: false) }
    it { is_expected.to have_db_column(:assigned_to).of_type(:integer) }
    it { is_expected.to have_db_column(:accommodation_type_id).of_type(:integer) }
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
    it { is_expected.to have_db_column(:currency).of_type(:string) }
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

  describe 'indexes' do
    it { is_expected.to have_db_index(:accommodation_type_id) }
    it { is_expected.to have_db_index(:assigned_to) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user).inverse_of(:places) }
    it { is_expected.to belong_to(:user).touch(true) }
    it { is_expected.to belong_to(:user).class_name('User').with_foreign_key('assigned_to') }
    it { is_expected.to belong_to(:coordinator).class_name('AdminUser').with_foreign_key('coordinator_id') }
    it { is_expected.to belong_to(:accommodation_type).class_name('AccommodationType').with_foreign_key('accommodation_type_id') }
  end

  before do
    FactoryBot.create(
      :place,
      assigned_to: user.id,
      coordinator_id: coordinator.id,
      accommodation_type_id: user.accommodation_type.id
    )
  end

  describe 'status column' do
    subject(:create_place_with_status) do
      FactoryBot.build(
        :place,
        status: status_name,
        assigned_to: user.id,
        coordinator_id: coordinator.id,
        accommodation_type_id: user.accommodation_type.id
      )
    end

    context 'when status is valid' do
      Place.statuses.each_key do |status|
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
      it 'create valid Place with default status value' do
        expect(Place.last.available?).to be_truthy
      end
    end
  end

  describe 'currency column' do
    subject(:create_place_with_currency) do
      FactoryBot.build(
        :place,
        currency: currency_name,
        assigned_to: user.id,
        coordinator_id: coordinator.id,
        accommodation_type_id: user.accommodation_type.id
      )
    end

    context 'when currency is valid' do
      Place.currencies.each_value do |currency|
        let(:currency_name) { currency }

        it "create valid Place with currency #{currency}" do
          expect(create_place_with_currency.save).to be_truthy
        end
      end
    end

    context 'when currency is invalid' do
      let(:currency_name) { :invalid_name }

      it 'Place does not created' do
        expect { create_place_with_currency }.to raise_error(ArgumentError)
      end
    end

    context 'when currency is not present' do
      it 'create valid Place with default currency value' do
        expect(Place.last.currency_uah?).to be_truthy
      end
    end
  end
end
