# frozen_string_literal: true

require 'rails_helper'

describe 'Users' do
  describe 'sign up' do
    before do
      visit new_user_registration_path
    end

    it 'can reach a new form' do
      expect(page.status_code).to eq(200)
    end

    it 'can create a new user' do
      fill_in 'user[email]', with: 'abc@test.co'
      fill_in 'user[first_name]', with: 'Tester'
      fill_in 'user[last_name]', with: 'T'
      fill_in 'user[password]', with: 'abcdef'
      fill_in 'user[password_confirmation]', with: 'abcdef'
      click_on 'Sign up'

      expect(page).to have_content(/Homepage/)
    end

    it 'cannot create a new user without email' do
      fill_in 'user[password]', with: 'abcdef'
      fill_in 'user[password_confirmation]', with: 'abcdef'
      click_on 'Sign up'

      expect(page).to have_content(/Email can't be blank/)
      expect(page).to have_content(/First name can't be blank/)
      expect(page).to have_content(/Last name can't be blank/)
    end
  end
end
