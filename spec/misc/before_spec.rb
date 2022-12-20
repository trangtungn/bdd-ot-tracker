# frozen_string_literal: true

require 'rails_helper'

describe 'all types of before', type: :feature do
  count = 0
  count_each = 0
  count_all = 0

  shared_examples_for 'before :each' do
    it { is_expected.to eq 1 }
    it { is_expected.to eq 2 }
  end

  describe 'before' do
    subject { count }

    before do
      puts "before - count: #{count}"
      count += 1
      puts "after - count: #{count}"
    end

    it_behaves_like 'before :each'
  end

  describe 'before :each' do
    subject { count_each }

    before :each do
      puts "before - count_each: #{count_each}"
      count_each += 1
      puts "after - count_each: #{count_each}"
    end

    it_behaves_like 'before :each'
  end

  describe 'before :all' do
    subject { count_all }

    before :all do
      puts "before - count_all: #{count_all}"
      count_all += 1
      puts "after - count_all: #{count_all}"
    end

    it { is_expected.to eq 1 }
    it { is_expected.to eq 1 }
  end
end
