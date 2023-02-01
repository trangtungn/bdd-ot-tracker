# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Time.zone.today }
    rationale { 'Some rationale today' }
    overtime_request { 1.5 }
    user
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'More rationale yesterday' }
    overtime_request { 2.5 }
    user { create(:second_user) }
  end

  factory :third_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'More rationale yesterday' }
    overtime_request { 3.5 }
    user { create(:second_user) }
  end
end
