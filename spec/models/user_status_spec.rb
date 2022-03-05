# frozen_string_literal: true

# spec/models/user_status.rb

require 'rails_helper'

RSpec.describe UserStatus, type: :model do
  USER_STATUSES = %i[urgent_to_call accommodated in_office in_trip at_home no_response declined].freeze
  describe 'attributes' do
    subject { described_class.new(status: USER_STATUSES[0]) }

    it { is_expected.to have_db_column(:status).of_type(:string) }
  end

  describe '#create' do
    subject(:create_user_status) { described_class.new(status: status) }

    context 'when status field is valid' do
      USER_STATUSES.each do |status|
        let(:status) { status }

        it "creates a valid UserStatus with #{status} value" do
          expect(create_user_status.save).to be_truthy
        end
      end
    end

    context 'when status field is invalid' do
      let(:status) { :invalid_name }

      it 'does not create UserStatus' do
        expect { create_user_status }.to raise_error(ArgumentError)
      end
    end

    context 'when UserStatus have already exist' do
      let(:status) { USER_STATUSES.first }

      before { UserStatus.create(status: status) }

      it 'does not create a new UserStatus' do
        expect { create_user_status.save }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
