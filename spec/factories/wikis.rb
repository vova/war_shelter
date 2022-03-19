# frozen_string_literal: true

FactoryBot.define do
  factory :wiki do
    page_id { 1 }
    title { 'MyString' }
    body { 'MyText' }
  end
end
