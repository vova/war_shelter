FactoryBot.define do
  factory :accommodation_type do
    name { AccommodationType::ACCOMMODATION_TYPES[0] }
  end
end
