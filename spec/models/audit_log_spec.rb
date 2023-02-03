# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  describe 'Creation' do
    subject { FactoryBot.create(:audit_log) }

    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'cannot be created without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'cannot be created without a status' do
      subject.status = nil
      expect(subject).not_to be_valid
    end

    it 'cannot be created without a start date' do
      subject.start_date = nil
      expect(subject).not_to be_valid
    end

    it 'start date must be 6 days prior' do
      user = FactoryBot.create(:user)
      new_audit_log = described_class.create(user: user)

      expect(new_audit_log.start_date).to eq(Time.zone.today - 6.days)
    end
  end
end
