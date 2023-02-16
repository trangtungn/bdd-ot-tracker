# frozen_string_literal: true

require 'rails_helper'

### Task 3:

# Assume we have to integrate RoRoom booking with a 3rd-party booking system
# (let's called it Lunar) that only allows one booking with maximum 3 hours
# and there must be 15 minutes buffer between bookings.

# When the user places a single RoRoom booking, our RoRoom system must create
# sufficient bookings to block availability on their system properly.
# Eg. we need to create more Lunar bookings if our RoRoom booking spans many more hours.

# Given minute of day (eg. minute 100 from 00:00) as the time input, a booking
# is represented as 100 -> 200, 100 being start minute of the day and
# 200 being end minute of the day.

# Write a function called `splits` (defined in **lib/minutes.rb**) that
# converts a RoRoom booking into an array of Lunar bookings
# (each array item is represented similarly with start minute of the day and end minute of the day).

# Eg.
# - Input: [100, 200] -> Output: [[100, 200]]
#   * Explanation: duration 100 < max duration 180
# - Input: [100, 280] -> Output: [[100, 280]]
#   * Explanation: duration 180 = max duration 180
# - Input: [100, 325] -> Output: [[100, 280], [295, 325]]
#   * Explanation: 295 - 280 = 15m booking buffer, last booking (325 - 295) < 180
# - Input: [100, 550] -> Output: [[100, 280], [295, 475], [490, 550]]
#   * Explanation: 490 - 475 = 15m booking buffer, last booking (550 - 490) < 180
# - Input: [100, 295] -> Output: [[100, 280]]
#   * Explanation: duration 180 = max duration + 15m booking buffer

# We have prepared a list of test cases in **spec/lib/minutes_spec.rb**. Make them pass.

describe Minutes do
  describe 'splits' do
    context 'when duration is less than max duration' do
      it 'returns 1 split' do
        expect(described_class.splits(100, 200)).to contain_exactly([100, 200])
      end
    end

    context 'when duration is equal to max duration' do
      it 'returns 1 split' do
        expect(described_class.splits(100, 280)).to contain_exactly([100, 280])
      end
    end

    context 'when duration is greater than max duration' do
      it 'returns 2 splits' do
        expect(described_class.splits(100, 325)).to contain_exactly([100, 280], [295, 325])
      end
    end

    context 'when duration is much greater (multiple of) than max duration' do
      it 'returns 3 splits' do
        expect(described_class.splits(100, 550)).to contain_exactly([100, 280], [295, 475], [490, 550])
      end
    end

    context 'when sum of duration and buffer duration equal to max duration' do
      it 'returns 1 split' do
        expect(described_class.splits(100, 295)).to contain_exactly([100, 280])
      end
    end
  end
end
