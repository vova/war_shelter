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
end
