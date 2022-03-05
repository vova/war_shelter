FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    status_id { 1 }
    coordinator_id { 1 }
    from { FFaker::Address.city }
    destination { FFaker::Address.city }
    adults { 2 }
    kids { nil }
    kids_comment { 'Kids comment' }
    pets { false }
    phone { FFaker::PhoneNumber.phone_number }
    phone2 { FFaker::PhoneNumber.phone_number }
    geo { 'UA' }
    accommodation_pref { 3 }
    transport_id { 1 }
    date_arrival { Time.now + 2.days }
    request_id { '2' }
    vaccination { true }
    comment { FFaker::Lorem.sentence }
  end
end