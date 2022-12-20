# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  before do
    user = User.create(
      email: 'abc@test.co',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Jon',
      last_name: 'Doe'
    )
    sign_in(user, scope: :user)

    visit new_post_path
  end

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
      expect(page.status_code).to eq(200)
    end

    it 'can create a new post' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'Some rationale'

      click_on 'Save'

      expect(page).to have_content(/Some rationale/)
    end

    it 'can create a new post with a user associated with it' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'User association'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User association')
    end
  end
end
