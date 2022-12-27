
user = User.create!(
  first_name: 'Test',
  last_name: 'T',
  email: 'test@t.co',
  password: '123456',
  password_confirmation: '123456'
)
p "User has been created."
p user

num = 100.freeze
num.times do |idx|
  Post.create!(
    user_id: user.id,
    date: Time.zone.today,
    rationale: "#{idx} rationale content: There are many variations " \
      "of passages of Lorem Ipsum available, but the majority have " \
      "suffered alteration in some form, by injected humour, or " \
      "randomised words which don't look even slightly believable."
  )
end

p "#{num} posts have been created."
