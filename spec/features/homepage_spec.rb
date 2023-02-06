# frozen_string_literal: true

require 'rails_helper'

describe 'Homepage' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }

  let(:post) { FactoryBot.create(:post, user: user) }

  before do
    post
    sign_in(admin)

    visit root_path
  end

  it 'allows admin to approve pending request' do
    click_on "approve_#{post.id}"

    expect(post.reload.status).to eq 'approved'
  end
end
