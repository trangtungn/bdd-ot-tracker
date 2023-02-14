# frozen_string_literal: true

class Room < ApplicationRecord
  ### Constants
  CURRENCIES = {
    usd: 'USD',
    gbp: 'GBP',
    eur: 'EUR'
  }.freeze

  ### Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :currency, presence: true
  validates :currency, inclusion: { in: CURRENCIES.values }
  validates :price_per_hour, numericality: { greater_than_or_equal_to: 0.0 }
end
