class AccommodationType < ApplicationRecord
  enum name: {
    shelter: 'Shelter',
    hostel: 'Hostel',
    hotel: 'Hotel',
    private_house: 'Private house',
    friendly_apartment: 'Friendly apartment',
    rent_apartment: 'Rent apartment'
  }, _default: 'Shelter'
end
