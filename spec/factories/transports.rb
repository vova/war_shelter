FactoryBot.define do
  factory :transport do
    name { Transport.names.values.first }
  end
end
