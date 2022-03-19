# frozen_string_literal: true

FactoryBot.define do
  factory :user_status do
    status { UserStatus.statuses.values.first }
  end
end
