require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'can be reached successfully' do
      get '/posts'

      expect(response.status_code).to eq(200)
    end
  end
end
