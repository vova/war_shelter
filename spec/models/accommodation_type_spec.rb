require 'rails_helper'

RSpec.describe AccommodationType, type: :model do
  describe '#create' do
    subject(:create_accommodation_type) { AccommodationType.new(name: type_name) }

    context 'when name field is valid' do
      AccommodationType.names.each_value do |type|
        let(:type_name) { type }

        it "creates valid AccommodationType with name: #{type}" do
          expect(create_accommodation_type.save).to be_truthy
        end
      end
    end

    context 'when name field is invalid' do
      let(:type_name) { :invalid_name }

      it 'does not create AccommodationType' do
        expect { create_accommodation_type }.to raise_error(ArgumentError)
      end
    end

    context 'when AccommodationType already exists' do
      let(:type_name) { AccommodationType.names.values.first }

      before { AccommodationType.create(name: type_name) }

      it 'does not create new AccommodationType' do
        expect { create_accommodation_type.save }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
