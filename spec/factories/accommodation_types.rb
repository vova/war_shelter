# frozen_string_literal: true

FactoryBot.define do
  factory :accommodation_type do
    name { AccommodationType.names.values.first }
  end
end
