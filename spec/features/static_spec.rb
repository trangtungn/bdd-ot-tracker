# frozen_string_literal: true

require 'rails_helper'

describe 'Static' do
  let(:user) { FactoryBot.create(:user) }

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
  end
end
