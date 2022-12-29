# frozen_string_literal: true

require 'rails_helper'

describe 'Static' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
      expect(page).to have_content(/Homepage/)
    end
  end
end
