# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static', type: :request do
  describe 'GET /homepage' do
    it 'returns a 200 OK status' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end
end
