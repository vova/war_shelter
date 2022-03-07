class AccommodationType < ApplicationRecord
  SHELTER = 'Shelter'
  HOSTEL = 'Hostel'
  HOTEL = 'Hotel'
  PRIVATE_HOUSE = 'Private house'
  FRIENDLY_APARTMENT = 'Friendly apartment'
  RENT_APARTMENT = 'Rent apartment'
  NEIGHBOURS = 'Room with neighbours'

  ACCOMMODATION_TYPE = {
    'Shelter'=> SHELTER,
    'Hostel' => HOSTEL,
    'Hotel' => HOTEL,
    'Private house' => PRIVATE_HOUSE,
    'Friendly apartment' => FRIENDLY_APARTMENT,
    'Rent apartment' => RENT_APARTMENT,
    'Room with neighbours' => NEIGHBOURS
  }

  enum name: ACCOMMODATION_TYPE, _default: SHELTER
end
