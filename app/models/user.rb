class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_paper_trail

  belongs_to :user_status,
             foreign_key: 'status_id', class_name: 'UserStatus'
  belongs_to :coordinator,
             foreign_key: 'coordinator_id', class_name: 'AdminUser'
  belongs_to :accommodation_type,
             foreign_key: 'accommodation_pref', class_name: 'AccommodationType'
  belongs_to :transport
end
