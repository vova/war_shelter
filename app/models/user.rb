# frozen_string_literal: true

# class allows database access to users table
class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include EmailValidations
  include PhoneValidations

  has_paper_trail

  belongs_to :user_status, inverse_of: :users, foreign_key: 'status_id', class_name: 'UserStatus'
  belongs_to :coordinator, class_name: 'AdminUser'
  belongs_to :accommodation_type, inverse_of: :users, foreign_key: 'accommodation_pref', class_name: 'AccommodationType'
  belongs_to :transport
  belongs_to :region
  belongs_to :country

  has_many :places, dependent: :destroy, inverse_of: :user, autosave: true
  scope :to_pay_attention, ->(current_admin_user) { where(coordinator_id: current_admin_user.id) }

  def vaccination_status
    return 'Yes' if vaccination

    'No'
  end

  def pets_status
    return 'Yes' if pets

    'No'
  end
end
