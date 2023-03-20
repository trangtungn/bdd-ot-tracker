# frozen_string_literal: true

require 'rails_helper'

describe 'Homepage' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  let(:post) { FactoryBot.create(:post, user: user) }
  let(:audit_log) { FactoryBot.create(:audit_log, user: user) }

  describe 'admin' do
    before do
      post

      sign_in(admin)

      visit root_path
    end

    it 'is allowed to approve pending request' do
      click_on "approve_#{post.id}"

      expect(post.reload.status).to eq 'approved'
    end
  end

  describe 'employee' do
    before do
      audit_log

      sign_in(user)

      visit root_path
    end

    it 'is allowed to change the audit log status from the homepage' do
      click_on "confirm_#{audit_log.id}"

      expect(audit_log.reload.status).to eq 'confirmed'
    end
  end
end
