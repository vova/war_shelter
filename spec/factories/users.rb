# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    user_status
    coordinator { association(:admin_user) }
    from { FFaker::Address.city }
    destination { FFaker::Address.city }
    region
    adults { 2 }
    kids { 2 }
    kids_comment { 'Kids comment' }
    pets { true }
    phone do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    phone2 { '' }
    geo { 'UA' }
    accommodation_type
    transport
    date_arrival { 2.days.from_now }
    request_id { '2' }
    vaccination { true }
    comment { FFaker::Lorem.sentence }
  end
end
