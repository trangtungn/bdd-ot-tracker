# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    it 'can reach a new form' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    it 'can create a new post' do
      visit new_post_path

      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'

      expect(page).to have_content(/Some/)
    end
  end
end
