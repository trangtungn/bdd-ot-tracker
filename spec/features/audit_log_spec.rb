# frozen_string_literal: true

require 'rails_helper'

describe 'AuditLogs' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  let(:audit_log) { FactoryBot.create(:audit_log, user: user) }

  before do
    sign_in(admin)
  end

  describe 'index' do
    it 'can be reached' do
      visit audit_logs_path

      expect(page.status_code).to eq(200)
    end

    it 'shows audit log list' do
      audit_log

      visit audit_logs_path

      expect(page).to have_content(user.full_name)
    end

    it 'cannot be reached by a non admin user' do
      sign_out(admin)

      sign_in(user)

      visit audit_logs_path

      expect(page).to have_current_path(root_path)
    end
  end
end
