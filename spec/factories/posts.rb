# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Faker::Time.between(from: DateTime.now - 10, to: DateTime.now) }
    rationale { Faker::Lorem.unique.paragraph }
    overtime_request { Faker::Number.decimal(l_digits: 2) }
    user
  end

  factory :second_post, class: 'Post' do
    date { Faker::Time.between(from: DateTime.now - 10, to: DateTime.now) }
    rationale { Faker::Lorem.unique.paragraph }
    overtime_request { Faker::Number.decimal(l_digits: 2) }
    user { create(:second_user) }
  end

  factory :third_post, class: 'Post' do
    date { Date.yesterday }
    rationale { Faker::Lorem.unique.paragraph }
    overtime_request { Faker::Number.decimal(l_digits: 2) }
    user { create(:second_user) }
  end
end
