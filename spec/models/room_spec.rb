# frozen_string_literal: true

require 'rails_helper'

# RoRoom

# RoRoom is an imaginary hotel that's planning to open the its first hotel
# building in planet Mars in 2040. But at the moment, they want to construct a website
# that validates people's demand on planet Earth.
# As part of the website construction crew,
# you'll be responsible for extending and adding new API endpoints so that
# the single-page web app (SPA) can interact to display & collect relevant data from the visitors.

RSpec.describe Room, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:currency) }

  it { is_expected.to allow_value('USD').for(:currency) }
  it { is_expected.to allow_value('GBP').for(:currency) }
  it { is_expected.to allow_value('EUR').for(:currency) }
  it { is_expected.not_to allow_value('ILS').for(:currency) }

  it { is_expected.to allow_value(1).for(:price_per_hour) }
  it { is_expected.to allow_value(0.0).for(:price_per_hour) }
  it { is_expected.not_to allow_value(-10.11).for(:price_per_hour) }

  it 'happily inserts record' do
    expect { create(:room) }.not_to raise_error
  end
end
