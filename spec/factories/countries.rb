# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { 'Country' }
    default_city { 'Default City' }
  end
end
