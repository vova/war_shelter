class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include EmailValidations
  include PhoneValidations

  has_paper_trail

  belongs_to :user_status,
             foreign_key: 'status_id', class_name: 'UserStatus'
  belongs_to :coordinator,
             foreign_key: 'coordinator_id', class_name: 'AdminUser'
  belongs_to :accommodation_type,
             foreign_key: 'accommodation_pref', class_name: 'AccommodationType'
  belongs_to :transport

  has_many :places, dependent: :destroy, inverse_of: :user, autosave: true
  scope :to_pay_attention, lambda { |current_admin_user| where(coordinator_id: current_admin_user.id) }
end
