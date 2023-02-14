# frozen_string_literal: true

class Minutes
  def self.splits(start_minute_of_day, end_minute_of_day, max_duration = 180, buffer_duration = 15)
    res = []

    duration = end_minute_of_day - start_minute_of_day
    num = duration / (max_duration + buffer_duration)

    if num.positive?
      num.times do |_idx|
        res << [start_minute_of_day, start_minute_of_day + max_duration]

        start_minute_of_day += max_duration + buffer_duration
      end
    end

    remainder = duration % (max_duration + buffer_duration)
    remainder = max_duration if remainder > max_duration

    res << [start_minute_of_day, start_minute_of_day + remainder] if remainder.positive?

    res
  end
end
