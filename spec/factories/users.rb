FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    status_id { 1 }
    coordinator_id { 1 }
    from { Faker::Address.city }
    destination { Faker::Address.full_address }
    adults { 2 }
    kids { nil }
    kids_comment { 'Kids comment' }
    pets { false }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    phone2 { Faker::PhoneNumber.phone_number_with_country_code }
    geo { 'UA' }
    accommodation_pref { 3 }
    transport_id { 1 }
    date_arrival { Faker::Date.forward(days: 2) }
    request_id { '2' }
    vaccination { true }
    comment { Faker::Lorem.sentence }
  end
end
