# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Time.zone.today }
    rationale { 'Some rationale today' }
    user
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'More rationale yesterday' }
    user { create(:second_user) }
  end

  factory :third_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'More rationale yesterday' }
    user { create(:second_user) }
  end
end
