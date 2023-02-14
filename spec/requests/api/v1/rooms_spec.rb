# frozen_string_literal: true

require 'rails_helper'

# _Coding tasks start below. If possible, demonstrate you can add test cases before actual code implementation._

## Room pricing data entry

## List rooms & prices

### Task 1:
# Extend an API endpoint `GET /api/v1/rooms` to return a list of rooms in JSON format:

#   ```
#   [
#     {
#       "id" : "12345",
#       "name": "Mars 1",
#       "description": "Welcom to Mars 1",
#       "price_per_hour": 11.11,
#       "currency": "EUR"
#     },
#     // ...
#   ]
#   ```

# - We have helped set up integration test for this endpoint in **spec/api/v1/get_rooms_spec.rb**.
# - Add/ cover what the test is missing for other fields in the response format above.

### Task 2:
# Extend the API endpoint `GET /api/v1/rooms` to return a list of rooms within a price (per hour) range with currency.

# - Scenario 1:
#   * Return all rooms if no parameters are specified.
# - Scenario 2:
#   * Return a list of rooms whose price (per hour) is equal or greater than the specified price and specified currency.
# - Scenario 3:
#   * Return a list of rooms whose price (per hour) is equal or less than the specified price and specified currency.
# - Scenario 4:
#   * Return a list of rooms whose price (per hour) is within the price range with specified currency.
# - Scenario 5:
#   * Return proper error status code if price parameters are specified without the currency parameter.

RSpec.describe 'Api::V1::Rooms', type: :request do
  let(:rooms) { create_list(:room, 2) }
  let(:room_a) { rooms.first }

  let(:rooms_same_currency) { create_list(:room_in_usd, 4).sort_by(&:price_per_hour) }
  let(:room_min_price) { rooms_same_currency.first }
  let(:room_max_price) { rooms_same_currency.last }

  # before { get '/api/v1/rooms' }

  it 'returns all rooms' do
    rooms
    room_a

    get '/api/v1/rooms'

    expect(response).to have_http_status(:ok)

    response_body = JSON.parse(response.body)
    expect(response_body.size).to eq(rooms.size)

    room_a_response = response_body.find { |i| i['id'] == room_a.id }
    expect(room_a_response['name']).to eq(room_a.name)
    expect(room_a_response['description']).to eq(room_a.description)
    expect(room_a_response['currency']).to eq(room_a.currency)
    expect(room_a_response['price_per_hour']).to eq(room_a.price_per_hour.to_f)
  end

  it 'returns a list of rooms whose price (per hour) is >= the specified price and specified currency' do
    get '/api/v1/rooms', params: {
      min: room_min_price.price_per_hour,
      currency: room_min_price.currency
    }

    expect(response).to have_http_status(:ok)

    response_body = JSON.parse(response.body)
    response_body.each do |room_response|
      expect(room_response['currency']).to eq(room_min_price.currency)
      expect(room_response['price_per_hour']).to be >= room_min_price.price_per_hour
    end
  end

  it 'returns a list of rooms whose price (per hour) is <= the specified price and with specified currency' do
    get '/api/v1/rooms', params: {
      max: room_max_price.price_per_hour,
      currency: room_max_price.currency
    }

    expect(response).to have_http_status(:ok)

    response_body = JSON.parse(response.body)

    response_body.each do |room_response|
      expect(room_response['currency']).to eq(room_max_price.currency)
      expect(room_response['price_per_hour']).to be <= room_max_price.price_per_hour
    end
  end

  it 'returns a list of rooms whose price (per hour) is within the price range and with specified currency' do
    get '/api/v1/rooms', params: {
      min: room_min_price.price_per_hour,
      max: room_max_price.price_per_hour,
      currency: room_max_price.currency
    }

    expect(response).to have_http_status(:ok)

    response_body = JSON.parse(response.body)
    response_body.each do |room_response|
      expect(room_response['currency']).to eq(room_max_price.currency)
      expect(room_response['price_per_hour']).to be >= room_min_price.price_per_hour
      expect(room_response['price_per_hour']).to be <= room_max_price.price_per_hour
    end
  end
end
