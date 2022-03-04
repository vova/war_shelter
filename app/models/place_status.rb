class PlaceStatus < ApplicationRecord
  enum name: %i[available booked assigned not_available paid_in_advance]
end
