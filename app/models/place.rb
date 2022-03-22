# frozen_string_literal: true

# class allows database access to places table
class Place < ApplicationRecord
  include PhoneValidations
  include PgSearch::Model

  belongs_to :user,
             inverse_of: :places,
             touch: true,
             foreign_key: 'assigned_to',
             class_name: 'User',
             optional: true
  belongs_to :coordinator, class_name: 'AdminUser'
  belongs_to :accommodation_type
  belongs_to :region
  belongs_to :country

  has_paper_trail

  enum status: { available: 0, booked: 1, assigned: 2, not_available: 3, paid_in_advance: 4 }

  enum currency: {
    uah: 'UAH',
    usd: 'USD',
    eur: 'EUR',
    pln: 'PLN'
  }, _default: 'UAH', _prefix: :currency

  scope :to_pay_attention, lambda { |current_admin_user|
    where(coordinator_id: current_admin_user.id).where.not(status: :not_available)
  }

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

  scope :content_matches, ->(term) { super_search(term) }

  scope :available_places_for, lambda { |user|
    query = available.where(
      arel_table[:region_id].eq(
        user.region_id
      ).and(
        arel_table[:capacity].gteq(
          (user.adults || 0) + (user.kids || 0)
        ).or(
          Arel::Nodes::SqlLiteral.new(
            '"places"."beds" * 2'
          ).gteq(user.adults || 0).and(
            arel_table[:kids_beds].gteq(
              user.kids || 0
            )
          )
        )
      )
    )

    if user.pets
      query = query.where(
        arel_table[:is_pets_allowed].eq(
          user.pets
        )
      )
    end

    query
  }

  def self.ransackable_scopes(_auth_object = nil)
    %i[content_matches]
  end

  def to_copy_format
    {
      type: accommodation_type.name,
      rooms: rooms_available,
      beds: beds,
      kids_beds: kids_beds.to_i.positive? ? kids_beds : nil,
      pets: is_pets_allowed ? 'allowed' : nil,
      price_per_day: price_per_day,
      price_per_month: price_per_month,
      currency: currency,
      address: address,
      phone: phone,
      phone2: phone2,
      contact_name: contact_name
    }.filter_map { |k, v| "#{k}: #{v}" if v.present? }.compact.join(' | ')
  end
end
