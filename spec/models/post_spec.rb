# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    let(:post) do
      described_class.create(date: Time.zone.today, rationale: 'Anything')
    end

    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      post.date = nil
      post.rationale = nil
      expect(post).not_to be_valid
    end
  end
end
