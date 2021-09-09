# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    let(:user) do
      described_class.create(
        email: 'test@ott.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: 'Test',
        last_name: 'User'
      )
    end

    it 'can be created' do
      expect(user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      user.first_name = nil
      user.last_name = nil

      expect(user).not_to be_valid
    end
  end
end
