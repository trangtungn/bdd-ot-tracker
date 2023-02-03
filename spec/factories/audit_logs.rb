# frozen_string_literal: true

FactoryBot.define do
  factory :audit_log do
    user
    status { 0 }
    start_date { Time.zone.today - 6.days }
    end_date { nil }
  end
end
