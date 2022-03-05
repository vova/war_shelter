class Place < ApplicationRecord
  enum status: %i[available booked assigned not_available paid_in_advance]
end
