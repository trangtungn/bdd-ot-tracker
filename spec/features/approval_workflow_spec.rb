# frozen_string_literal: true

require 'rails_helper'

describe 'Posts' do
  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in(admin)
  end

  describe 'edit' do
    let(:post) { FactoryBot.create(:post) }

    before do
      visit edit_post_path(post)
    end

    it 'has status in the form and can be edited by admin' do
      choose('post_status_approved')
      click_on 'Save'

      expect(post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      sign_out(admin)

      sign_in(user)

      visit edit_post_path(post)

      expect(page).not_to have_content('Approved')
    end
  end
end
