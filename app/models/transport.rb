class Transport < ApplicationRecord
  enum name: {
    car: 'Can',
    train: 'Train',
    bus: 'Bus',
    no_transport: 'No transport',
    unknown: 'Unknown'
  }, _default: 'Car'
end
