require 'rails_helper'

RSpec.describe Wiki, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:page_id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(limit: 100, null: false) }
    it { is_expected.to have_db_column(:body).of_type(:text) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:page_id) }
  end

  describe 'Paper Trail', versioning: true do
    context 'when PaperTrail enabled' do
      before { PaperTrail.request.enable_model(Wiki) }
      let(:subject) { FactoryBot.create :wiki }

      it 'creates versions' do
        expect(subject.versions.count).to eq 1
      end
    end

    context 'when PaperTrail disabled' do
      before { PaperTrail.request.disable_model(Wiki) }
      let(:untracked_subject) { FactoryBot.create :wiki }

      it 'does not create versions' do
        expect(untracked_subject.versions.count).to eq 0
      end
    end
  end
end
