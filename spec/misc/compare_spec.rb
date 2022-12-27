# frozen_string_literal: false

require 'rails_helper'

describe 'all compare statements', type: :feature do
  num = 1
  str = ''
  arr = { a: 1 }

  describe 'Fixnum' do
    it('expects Fixnums eq by value of the objects') { expect(num).to eq(1) }
    # it('expects Fixnums eql value of the objects') { expect(num).to eql(1) }
    it('expects Fixnums equal by object_id of the objects') { expect(num).to equal 1 }
    it('expects Fixnums to be by object_id of the objects') { expect(num).to be 1 }
  end

  describe 'String' do
    it('expects strings eq by value of the objects') { expect(str).to eq '' }
    it('expects strings eql by value of the objects') { expect(str).to eql '' }
    it('expects Strings NOT equal by object_id of the objects') { expect(str).not_to equal '' } # Failed
    it('expects strings NOT to be by object_id of the objects') { expect(str).not_to be '' } # Failed
  end

  describe 'Array' do
    it('expects Arrays eq by value of the objects') { expect(arr).to eq a: 1 }
    it('expects Arrays eql by value of the objects') { expect(arr).to eql(a: 1) }
    it('expects Arrays NOT equal by object_id of the objects') { expect(arr).not_to equal({ a: 1 }) } # Failed
    it('expects Arrays NOT to be by object_id of the objects') { expect(arr).not_to be a: 1 }         # Failed
  end
end
