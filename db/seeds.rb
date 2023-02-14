
user = User.create!(
  first_name: 'Test',
  last_name: 'T',
  email: 'test@t.co',
  phone: '123-456-7890',
  password: '123456',
  password_confirmation: '123456'
)
p "Test user has been created."
p user

user2 = User.create!(
  first_name: 'Test2',
  last_name: 'T',
  email: 'test2@t.co',
  phone: '123-654-7890',
  password: '123456',
  password_confirmation: '123456'
)
p "Test2 user has been created."
p user2

admin = AdminUser.create!(
  first_name: 'Admin',
  last_name: 'T',
  email: 'admin@t.co',
  phone: '132-456-7890',
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

num.times do |idx|
  AuditLog.create!(
    user: user,
    start_date: Time.zone.today - 6.days
  )
end

p "#{num} audit logs have been created."

Room.create(
  name: Faker::Space.planet,
  description: Faker::Lorem.paragraph,
  price_per_hour: Faker::Number.decimal(l_digits: 2),
  currency: Room::CURRENCIES.values.sample
)

Room.create(
  name: Faker::Space.planet,
  description: Faker::Lorem.paragraph,
  price_per_hour: Faker::Number.decimal(l_digits: 2),
  currency: Room::CURRENCIES.values.sample
)
p '2 rooms have been created.'