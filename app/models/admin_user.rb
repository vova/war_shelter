# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include EmailValidations
  include PhoneValidations

  belongs_to :country

  has_paper_trail
end
