# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    phone do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    phone2 do
      FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[\s-]/, '')
    end
    password { 'password' }
    password_confirmation { 'password' }
  end
end
