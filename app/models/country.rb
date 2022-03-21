# frozen_string_literal: true

# class allows database to access to contries table
class Country < ApplicationRecord
  enum code: { ua: 0, pl: 1, ro: 2, hu: 3, md: 4, sk: 5, cz: 6, de: 7 }, _default: 0
end
