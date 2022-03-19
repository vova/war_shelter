# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:phone2).of_type(:string) }
    it { is_expected.to have_db_column(:vaccination).of_type(:boolean) }
  end

  describe 'validations' do
    context 'duplicate email' do
      subject { create(:admin_user) }
      let(:duplicate) { subject.dup }
      it 'should not create user with the same email' do
        expect { duplicate.save! }.to raise_error(ActiveRecord::RecordInvalid)
        expect(duplicate.errors.messages[:email].first).to match(/already been taken/)
      end
    end
  end

  describe 'Paper Trail', versioning: true do
    context 'when PaperTrail enabled' do
      before { PaperTrail.request.enable_model(AdminUser) }
      let(:subject) { FactoryBot.create :admin_user }

      it 'creates versions' do
        expect(subject.versions.count).to eq 1
      end

      it 'does not include password attributes' do
        expect(subject.versions.last.object_changes.exclude?('password')).to be_truthy
      end
    end

    context 'when PaperTrail disabled' do
      before { PaperTrail.request.disable_model(AdminUser) }
      let(:untracked_subject) { FactoryBot.create :admin_user }

      it 'does not create versions' do
        expect(untracked_subject.versions.count).to eq 0
      end
    end
  end
end
