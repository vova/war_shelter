class Transport < ApplicationRecord
  BY_COMPANY = 'Provided by company'
  NOT_BY_COMPANY = 'Not provided by company'

  enum name: {
    car: 'Car',
    train: 'Train',
    bus: 'Bus',
    no_transport: 'No transport',
    unknown: 'Unknown'
  }, _default: 'Car'

  def self.to_select_collection
    all.map do |tr|
      [
        tr.presentable_name,
        tr.id
      ]
    end
  end

  def presentable_name
    "#{name} - "\
    "#{company_transfer ? BY_COMPANY : NOT_BY_COMPANY }"
  end
end
