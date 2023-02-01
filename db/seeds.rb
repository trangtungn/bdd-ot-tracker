
user = User.create!(
  first_name: 'Test',
  last_name: 'T',
  email: 'test@t.co',
  password: '123456',
  password_confirmation: '123456'
)
p "Test user has been created."
p user

user2 = User.create!(
  first_name: 'Test2',
  last_name: 'T',
  email: 'test2@t.co',
  password: '123456',
  password_confirmation: '123456'
)
p "Test2 user has been created."
p user2

admin = AdminUser.create!(
  first_name: 'Admin',
  last_name: 'T',
  email: 'admin@t.co',
  password: '123456',
  password_confirmation: '123456'
)
p "Admin user has been created."
p admin

num = 100.freeze
num.times do |idx|
  Post.create!(
    user_id: user.id,
    overtime_request: 1.0,
    date: Time.zone.today,
    rationale: "#{idx} content: There are many variations " \
      "of passages of Lorem Ipsum available, but the majority have " \
      "suffered alteration in some form, by injected humour, or " \
      "randomised words which don't look even slightly believable."
  )
end

p "#{num} posts have been created."
