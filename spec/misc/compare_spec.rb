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
    it('expects Strings equal by object_id of the objects') { expect(str).to equal '' } # Failed
    it('expects strings to be by object_id of the objects') { expect(str).to be '' } # Failed
  end

  describe 'Array' do
    it('expects Arrays eq by value of the objects') { expect(arr).to eq a: 1 }
    it('expects Arrays eql by value of the objects') { expect(arr).to eql(a: 1) }
    it('expects Arrays equal by object_id of the objects') { expect(arr).to equal({ a: 1 }) } # Failed
    it('expects Arrays to be by object_id of the objects') { expect(arr).to be a: 1 }         # Failed
  end
end
