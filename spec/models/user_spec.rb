# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    subject do
      described_class.create(
        email: 'test@test.com',
        password: '123456',
        username: 'test'
      )
    end

    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'cannot be created without username' do
      subject.username = nil
      expect(subject).not_to be_valid
    end
  end
end
