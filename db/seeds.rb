# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%i[available booked assigned not_available paid_in_advance].each do |status|
  PlaceStatus.create(name: status) unless PlaceStatus.where(name: status).any?
end

%i[urgent_to_call accommodated in_office in_trip at_home no_response declined].each do |status|
  UserStatus.create(status: status) unless UserStatus.where(status: status).any?
end

Transport::TRANSPORT_NAMES.each do |name|
  [true, false].each do |company_transfer|
    transport_attributes = { name: name, company_transfer: company_transfer }
    Transport.create(transport_attributes) unless Transport.where(transport_attributes).any?
  end
end

AccommodationType::ACCOMMODATION_TYPES.each do |type|
  AccommodationType.create(name: type) unless AccommodationType.where(name: type).any?
end
