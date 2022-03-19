# frozen_string_literal: true

module PhoneValidations
  extend ActiveSupport::Concern

  PHONE_NUMBER_REGEX = /\A(?<country_code>\+\d{2,3})(?<city_code>\d{2})(?<number>\d{7})\z/.freeze
  INVALID_FORMAT_MSG = 'has invalid format. ex: +380786500980'

  included do
    validates :phone, presence: true, format: { with: PHONE_NUMBER_REGEX }
    validates :phone2, allow_blank: true, format: { with: PHONE_NUMBER_REGEX }
  end
end
