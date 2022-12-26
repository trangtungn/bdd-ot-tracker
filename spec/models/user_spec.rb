# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    subject do
      described_class.create(
        email: 'test@test.com',
        password: '123456',
        first_name: 'Tester',
        last_name: 'T'
      )
    end

    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'cannot be created without email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'cannot be created without first name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it 'cannot be created without last name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end
  end
end
