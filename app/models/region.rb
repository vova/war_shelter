# frozen_string_literal: true

# class allows database access to regions table
class Region < ApplicationRecord
  LVIV = 'Lviv'
  TERNOPIL = 'Ternopil'
  CHERNIVTSI = 'Chernivtsi'
  IVANO_FRANKIVSK = 'Ivano-Frankivsk'
  UZHGOROD = 'Uzhgorod'
  OTHER = 'Other'

  REGION_TYPE = {
    'Other' => OTHER,
    'Lviv' => LVIV,
    'Ternopil' => TERNOPIL,
    'Chernivtsi' => CHERNIVTSI,
    'Ivano-Frankivsk' => IVANO_FRANKIVSK,
    'Uzhgorod' => UZHGOROD
  }.freeze

  enum center: REGION_TYPE, _default: OTHER
end
