# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    name { 'MyString' }
    city { 'MyString' }
    region { 'MyString' }
    rooms_available { 4 }
    beds { 2 }
    kids_beds { 2 }
    is_pets_allowed { true }
    capacity { 2 }
    price_per_day { 1 }
    price_per_month { 1 }
    address { 'MyString' }
    distance_from_center { 1 }
    available_since { '2022-03-04 16:52:25' }
    available_till { '2022-03-04 16:52:25' }
    phone do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    phone2 do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    is_realtor { false }
    contact_name { 'MyString' }
    geo { 'MyString' }
    website { 'MyString' }
  end
end
