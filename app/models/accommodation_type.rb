class AccommodationType < ApplicationRecord
  ACCOMMODATION_TYPES = %i[shelter hostel hotel private_house friendly_apartment rent_apartment]

  enum name: ACCOMMODATION_TYPES

  validates_presence_of :name
end
