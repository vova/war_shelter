# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  describe 'attributes' do
    it { is_expected.to have_db_column(:center).of_type(:string) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:center) }
  end

  describe 'create region' do
    subject { described_class.new(center: center) }

    context 'when center field is valid' do
      Region.centers.each_value do |center|
        let(:center) { center }

        it "create a valid Region with #{center} value" do
          expect(subject.save).to be_truthy
        end
      end
    end

    context 'when center is invalid' do
      let(:center) { 'invalid' }

      it 'raise error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when RegionCenter have already exist' do
      let(:center) { Region.centers.values.first }
      let(:region) { create(:region) }

      before { region }

      it 'raise error with unique status' do
        expect { subject.save }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
