# frozen_string_literal: true

FactoryBot.define do
  factory :transport do
    name { Transport.names.values.first }
  end
end
