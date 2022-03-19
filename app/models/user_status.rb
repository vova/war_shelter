# frozen_string_literal: true

class UserStatus < ApplicationRecord
  has_many :users, dependent: :destroy, inverse_of: :user_status

  URGENT_TO_CALL = 'Urgent to call'
  ACCOMMODATED = 'Accommodated'
  IN_OFFICE = 'In office'
  IN_TRIP = 'In trip'
  AT_HOME = 'At home'
  NO_RESPONSE = 'No response'
  DECLINED = 'Declined'

  STATUSES = {
    'Urgent to call' => URGENT_TO_CALL,
    'Accommodated' => ACCOMMODATED,
    'In office' => IN_OFFICE,
    'In trip' => IN_TRIP,
    'At home' => AT_HOME,
    'No response' => NO_RESPONSE,
    'Declined' => DECLINED
  }.freeze

  enum status: STATUSES
end
