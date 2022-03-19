# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include EmailValidations
  include PhoneValidations

  has_paper_trail
end
