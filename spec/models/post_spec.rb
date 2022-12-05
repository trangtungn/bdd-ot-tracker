# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    subject { described_class.create(date: Time.zone.today, rationale: 'Anything') }

    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'cannot be created without date and rationale' do
      subject.date = nil
      subject.rationale = nil
      expect(subject).not_to be_valid
    end
  end
end
