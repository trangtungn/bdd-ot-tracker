# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    subject do
      FactoryBot.create(:user)
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

    it 'can return full name' do
      expect(subject.full_name).to eq 'T, Tester1'
    end
  end
end
