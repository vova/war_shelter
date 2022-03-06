# frozen_string_literal: true

# spec/models/user.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:status_id).of_type(:integer) }
    it { is_expected.to have_db_column(:coordinator_id).of_type(:integer) }
    it { is_expected.to have_db_column(:from).of_type(:string) }
    it { is_expected.to have_db_column(:destination).of_type(:string) }
    it { is_expected.to have_db_column(:adults).of_type(:integer) }
    it { is_expected.to have_db_column(:kids).of_type(:integer) }
    it { is_expected.to have_db_column(:kids_comment).of_type(:string) }
    it { is_expected.to have_db_column(:pets).of_type(:boolean) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:phone2).of_type(:string) }
    it { is_expected.to have_db_column(:geo).of_type(:string) }
    it { is_expected.to have_db_column(:accommodation_pref).of_type(:integer) }
    it { is_expected.to have_db_column(:transport_id).of_type(:integer) }
    it { is_expected.to have_db_column(:date_arrival).of_type(:datetime) }
    it { is_expected.to have_db_column(:request_id).of_type(:string) }
    it { is_expected.to have_db_column(:vaccination).of_type(:boolean) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
  end

  describe 'registration' do
    let(:user) { build(:user) }
    it "has a valid factory" do
        expect(user).to be_valid
    end

    it 'is database authenticable' do
      expect(user.valid_password?('password')).to be_truthy
    end
  end

  describe 'validations' do
    context 'duplicate email' do
      subject { create(:user) }
      let(:duplicate) { subject.dup }
      it 'should not create user with the same email' do
        expect { duplicate.save! }.to raise_error(ActiveRecord::RecordInvalid)
        expect(duplicate.errors.messages[:email].first).to match(/already been taken/)
      end
    end
  end
end
