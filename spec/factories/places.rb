FactoryBot.define do
  factory :place do
    name { "MyString" }
    city { "MyString" }
    region { "MyString" }
    rooms_available { 1 }
    beds { 1 }
    kids_beds { 1 }
    is_pets_allowed { false }
    capacity { 1 }
    price_per_day { 1 }
    price_per_month { 1 }
    address { "MyString" }
    distance_from_center { 1 }
    available_since { "2022-03-04 16:52:25" }
    available_till { "2022-03-04 16:52:25" }
    phone do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    phone2 do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    is_realtor { false }
    contact_name { "MyString" }
    geo { "MyString" }
    website { "MyString" }
    association :accommodation_type, factory: :accommodation_type
    association :coordinator, factory: :admin_user
  end
end
