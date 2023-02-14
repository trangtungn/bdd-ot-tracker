# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    name { Faker::Space.planet }
    description { Faker::Lorem.paragraph }
    price_per_hour { Faker::Number.decimal(l_digits: 2) }
    currency { Room::CURRENCIES.values.sample }
  end

  factory :room_in_usd, class: 'Room' do
    name { Faker::Space.planet }
    description { Faker::Lorem.paragraph }
    price_per_hour { Faker::Number.decimal(l_digits: 2) }
    currency { 'USD' }
  end
end
