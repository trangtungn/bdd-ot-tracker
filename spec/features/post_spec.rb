# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  let(:user) { FactoryBot.create(:user) }

  let(:post1) { FactoryBot.create(:post, user: user) }
  let(:post2) { FactoryBot.create(:second_post, user: user) }
  let(:post_of_other_user) { FactoryBot.create(:third_post) }

  before do
    sign_in(user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
      expect(page).to have_content(/List/)
    end

    it 'has a list of posts' do
      post1
      post2

      visit posts_path
      expect(page).to have_content(/rationale today/)
      expect(page).to have_content(/rationale yesterday/)
      expect(page).to have_content(/Tester1|Tester2/)
      expect(page).to have_content(1.5)
    end

    it 'has list of a specific user\'s posts' do
      post1
      post_of_other_user

      visit posts_path

      expect(page).to have_content(post1.rationale)
      expect(page).to have_content(post1.overtime_request)
      expect(page).to have_content(post1.user.full_name)
      expect(page).not_to have_content(post_of_other_user.rationale)
      expect(page).not_to have_content(post_of_other_user.user.full_name)
    end
  end

  describe 'new' do
    it 'has a link to new post in homepage' do
      visit root_path

      click_link 'New Entry'
      expect(page.status_code).to eq 200
      expect(page).to have_content(/New Entry/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'can reach a new form' do
      expect(page.status_code).to eq(200)
      expect(page).to have_content(/New Entry/)
    end

    it 'can create a new post' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'Some rationale'
      fill_in 'post[overtime_request]', with: 3.5

      expect { click_on 'Save' }.to change(Post.post_by(user), :count).by 1
      expect(page).to have_content(/Some rationale/)
    end

    it 'can create a new post with a user associated with it' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'User association'
      fill_in 'post[overtime_request]', with: 4.5

      click_on 'Save'

      expect(user.posts.last.rationale).to eq('User association')
      expect(user.posts.last.overtime_request).to eq(4.5)
    end

    it 'cannot create a post without overtime request' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'User association'

      expect { click_on 'Save' }.not_to(change { Post.post_by(user).count })
      expect(page).to have_content(/New Entry/)
    end
  end

  describe 'edit' do
    before do
      post1
    end

    it 'can reach edit post page' do
      visit posts_path

      click_link "edit_entry_#{post1.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can edit post' do
      visit edit_post_path(post1)

      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: 'New rationale'

      click_on 'Save'

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/Post/)
      expect(page).to have_content(/New rationale/)
    end

    it 'cannot edit by an unauthorized user (the post creator)' do
      visit edit_post_path(post_of_other_user)

      expect(page).to have_current_path(root_path)
    end

    # describe 'approval workflow' do
    #   it 'do not have status in form' do
    #     visit edit_post_path(post)
    #     expect(page).not_to have_content('Approved')
    #   end

    #   it 'can change status' do
    #     sign_out(user)

    #     admin_user = FactoryBot.create(:admin_user)
    #     sign_in(admin_user)

    #     visit edit_post_path(post)

    #     choose('post_status_approved')
    #     click_on 'Save'

    #     expect(post.reload.status).to eq('approved')
    #   end
    # end
  end

  describe 'delete' do
    before do
      post1
    end

    it 'can delete post' do
      visit posts_path

      click_link "delete_entry_#{post1.id}"

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/List Entries/)
      expect(page).to have_no_content(post1.rationale)
    end
  end
end
