class Place < ApplicationRecord
  enum status: %i[available booked assigned not_available paid_in_advance]

  enum currency: {
    uah: 'UAH',
    usd: 'USD',
    eur: 'EUR',
    pln: 'PLN'
  }, _default: 'UAH', _prefix: :currency

  belongs_to :coordinator,
             foreign_key: 'coordinator_id', class_name: 'AdminUser'
  belongs_to :accommodation_type,
             foreign_key: 'accomodation_type_id', # typo in foreign key
             class_name: 'AccommodationType'
end
