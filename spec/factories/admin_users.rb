FactoryBot.define do
  factory :admin_user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
