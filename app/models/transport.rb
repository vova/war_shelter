class Transport < ApplicationRecord
  TRANSPORT_NAMES = %i[car train bus no_transport unknown].freeze

  enum name: TRANSPORT_NAMES

  validates_presence_of :name
end
