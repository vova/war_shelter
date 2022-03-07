class Place < ApplicationRecord
  include PhoneValidations
  include PgSearch::Model

  belongs_to :user, inverse_of: :places, touch: true,
             foreign_key: 'assigned_to', class_name: 'User'
  belongs_to :coordinator,
             foreign_key: 'coordinator_id', class_name: 'AdminUser'
  belongs_to :accommodation_type,
             foreign_key: 'accommodation_type_id',
             class_name: 'AccommodationType'

  has_paper_trail

  enum status: %i[available booked assigned not_available paid_in_advance]

  enum currency: {
    uah: 'UAH',
    usd: 'USD',
    eur: 'EUR',
    pln: 'PLN'
  }, _default: 'UAH', _prefix: :currency

  TSEARCH_WEIGHTS = {
    highest: 'A',
    important: 'B',
    low: 'C'
  }.freeze

  SUPER_SEARCH_CONFIG = {
    against: [
      [:name, TSEARCH_WEIGHTS[:highest]],
      [:city, TSEARCH_WEIGHTS[:highest]],
      [:region, TSEARCH_WEIGHTS[:important]],
      [:address, TSEARCH_WEIGHTS[:highest]],
      [:phone, TSEARCH_WEIGHTS[:important]],
      [:phone2, TSEARCH_WEIGHTS[:low]],
      [:contact_name, TSEARCH_WEIGHTS[:important]],
      [:comment, TSEARCH_WEIGHTS[:important]]
    ],
    associated_against: {
      user: :name,
      coordinator: :name,
      accommodation_type: :name
    },
    using: {
      tsearch: {
        prefix: true,
        any_word: true
      },
      trigram: { threshold: 0.2 }
    },
    ranked_by: ':trigram'
  }.freeze

  pg_search_scope :super_search, SUPER_SEARCH_CONFIG
end
