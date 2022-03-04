require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(limit: 100, null: false) }
    it { is_expected.to have_db_column(:type).of_type(:integer) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:region).of_type(:string) }
    it { is_expected.to have_db_column(:rooms_available).of_type(:integer) }
    it { is_expected.to have_db_column(:beds).of_type(:integer) }
    it { is_expected.to have_db_column(:kids_beds).of_type(:integer) }
    it { is_expected.to have_db_column(:is_pets_allowed).of_type(:boolean) }
    it { is_expected.to have_db_column(:capacity).of_type(:integer).with_options(default: 2, null: false) }
    it { is_expected.to have_db_column(:additional_child_place).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:coordinator).of_type(:integer) }
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
  end
end
