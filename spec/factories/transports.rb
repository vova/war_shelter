FactoryBot.define do
  factory :transport do
    name { Transport::TRANSPORT_NAMES[0] }
  end
end
