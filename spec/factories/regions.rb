FactoryBot.define do
  factory :region do
    center { Region.centers.values.first }
  end
end
