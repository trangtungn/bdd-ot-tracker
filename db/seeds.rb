
user = User.create(email: 'test@t.co', password: '123456', password_confirmation: '123456')
p "User has been created."
p user

num = 100.freeze
num.times do |idx|
  p idx
  Post.create(user_id: user.id, date: Time.zone.today, rationale: "#{idx} rationale content")
end

p "#{num} posts have been created."
