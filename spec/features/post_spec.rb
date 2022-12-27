# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  let(:user) do
    User.create(
      email: 'abc@test.co',
      password: '123456',
      password_confirmation: '123456',
      first_name: 'Jon',
      last_name: 'Doe'
    )
  end

  before do
    sign_in(user, scope: :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a list of posts' do
      Post.create!(date: Time.zone.today, rationale: 'Post 1', user: user)
      Post.create!(date: Time.zone.today, rationale: 'Post 2', user: user)

      visit posts_path
      expect(page).to have_content(/Post 1|Post 2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

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
