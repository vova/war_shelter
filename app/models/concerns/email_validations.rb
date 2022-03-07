module EmailValidations
  extend ActiveSupport::Concern

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  INVALID_FORMAT_MSG = 'has invalid format'.freeze

  included do
    before_validation :normalize_email!
    validates :email, format: { with: EMAIL_REGEX, message: INVALID_FORMAT_MSG },
                      presence: true
  end

  private

  def normalize_email!
    email&.downcase!
    email&.strip!
  end
end