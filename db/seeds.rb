# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserStatus.statuses.each do |_, status|
  UserStatus.create(status: status) unless UserStatus.where(status: status).any?
end

Transport.names.each_value do |name|
  [true, false].each do |company_transfer|
    transport_attributes = { name: name, company_transfer: company_transfer }
    Transport.create(transport_attributes) unless Transport.where(transport_attributes).any?
  end
end

AccommodationType.names.each_value do |type|
  AccommodationType.create(name: type) unless AccommodationType.where(name: type).any?
end

AdminUser.create!(
  name: 'Vasya',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  phone: '+380981111111'
) if Rails.env.development?
