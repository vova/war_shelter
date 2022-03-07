class Transport < ApplicationRecord
  BY_COMPANY = 'Provided by company'
  NOT_BY_COMPANY = 'Not provided by company'

  CAR = 'Car'
  TRAIN = 'Train'
  BUS = 'Bus'
  NO_TRANSPORT = 'No transport'
  UNKNOWN = 'Unknown'

  TRANSPORTS = {
    'Car' => CAR,
    'Train' => TRAIN,
    'Bus' => BUS,
    'No transport' => NO_TRANSPORT,
    'Unknown' => UNKNOWN
  }

  enum name: TRANSPORTS, _default: CAR

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
