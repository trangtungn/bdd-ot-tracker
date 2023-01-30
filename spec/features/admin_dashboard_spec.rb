# frozen_string_literal: true

require 'rails_helper'

describe 'AdminUserDashboard' do
  it 'redirect to sign in page if not signed in' do
    visit admin_root_path
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'cannot be reached if non-admin user' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)

    visit admin_root_path
    expect(page).to have_current_path(root_path)
  end

  it 'can be reached if admin user' do
    admin_user = FactoryBot.create(:admin)
    login_as(admin_user, scope: :user)

    visit admin_root_path
    expect(page).to have_current_path(admin_root_path)
  end
end
