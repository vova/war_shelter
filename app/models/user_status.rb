class UserStatus < ApplicationRecord
  enum status: {
    urgent_to_call: "Urgent to call",
    accommodated: "Accommodated",
    in_office: "In office",
    in_trip: "In trip",
    at_home: "At home",
    no_response: "No response",
    declined: "Declined"
  }
end
