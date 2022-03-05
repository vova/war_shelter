class Place < ApplicationRecord
  belongs_to :user, inverse_of: :places, touch: true,
             foreign_key: 'assigned_to', class_name: 'User'
  belongs_to :coordinator,
             foreign_key: 'coordinator_id', class_name: 'AdminUser'
  belongs_to :accommodation_type,
             foreign_key: 'accommodation_type_id',
             class_name: 'AccommodationType'

  enum status: %i[available booked assigned not_available paid_in_advance]

  enum currency: {
    uah: 'UAH',
    usd: 'USD',
    eur: 'EUR',
    pln: 'PLN'
  }, _default: 'UAH', _prefix: :currency
end
