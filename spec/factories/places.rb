FactoryBot.define do
  factory :place do
    name { "MyString" }
    type { 1 }
    city { "MyString" }
    region { "MyString" }
    rooms_available { 1 }
    beds { 1 }
    kids_beds { 1 }
    is_pets_allowed { false }
    capacity { 1 }
    status { 1 }
    price_per_day { 1 }
    price_per_month { 1 }
    is_price_in_dollars { false }
    address { "MyString" }
    distance_from_center { 1 }
    available_since { "2022-03-04 16:52:25" }
    available_till { "2022-03-04 16:52:25" }
    phone { "MyString" }
    phone2 { "MyString" }
    is_realtor { false }
    contact_name { "MyString" }
    geo { "MyString" }
    website { "MyString" }
  end
end
