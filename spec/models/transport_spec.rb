# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transport, type: :model do
  describe '#create' do
    subject(:create_transport) { Transport.new(name: transport_name) }

    context 'when name field is valid' do
      Transport.names.each_value do |name|
        let(:transport_name) { name }

        it "creates valid Transport with name: #{name}" do
          expect(create_transport.save).to be_truthy
        end
      end
    end

    context 'when name field is invalid' do
      let(:transport_name) { :invalid_name }

      it 'does not create new Transport' do
        expect { create_transport }.to raise_error(ArgumentError)
      end
    end

    context 'when Transport name already exists' do
      let(:transport_name) { Transport.names.values.first }

      before { Transport.create(name: transport_name) }

      it 'does not create new Transport with the same company_transfer' do
        expect { create_transport.save }.to raise_error(ActiveRecord::RecordNotUnique)
      end

      it 'creates valid Transport if company_transfer differs' do
        transport = Transport.new name: transport_name, company_transfer: true
        expect(transport.save).to be_truthy
      end
    end
  end
end
