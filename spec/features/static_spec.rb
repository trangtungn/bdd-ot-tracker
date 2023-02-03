# frozen_string_literal: true

require 'rails_helper'

describe 'Static' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  describe 'homepage' do
    it 'redierect user not signed in to log in page' do
      visit root_path
      expect(page.status_code).to eq(200)
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'can be reached successfully' do
      sign_in user

      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/Homepage/)
    end

    it 'is not visible to non admin user' do
      sign_in user

      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).not_to have_content(/Audit Logs/)
    end

    it 'is visible to admin user' do
      sign_in admin

      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/Audit Logs/)
    end
  end
end
