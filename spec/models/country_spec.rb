# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'attributes' do
    it { is_expected.to have_db_column(:code).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:default_city).of_type(:string) }
    it { is_expected.to have_db_column(:time_zone).of_type(:string) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:code) }
  end

  let(:country) { create(:country) }

  describe 'create country' do
    subject { FactoryBot.build(:country, code: code) }

    context 'when code field is valid' do
      Country.codes.each_key do |code|
        let(:code) { code }

        it "create valid Country with status #{code}" do
          expect(subject.save).to be_truthy
        end
      end
    end

    context 'when code is invalid' do
      let(:code) { :invalide_code }

      it 'Country does not created' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when code is not present' do
      before { country }

      it 'create valid Country with default status value' do
        expect(Country.last.code?).to be_truthy
      end
    end
  end
end
