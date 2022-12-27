# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "test#{n}@t.co"
  end

  factory :user do
    first_name { 'Tester1' }
    last_name { 'T' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :second_user, class: 'User' do
    first_name { 'Tester2' }
    last_name { 'T' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :admin, class: 'AdminUser' do
    first_name { 'Test' }
    last_name { 'Admin' }
    email { 'admin@t.co' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
