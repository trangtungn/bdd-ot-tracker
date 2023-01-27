# frozen_string_literal: true

# test/mailers/previews/my_mailer_preview.rb
# Preview all emails at http://localhost:3000/rails/mailers/my_mailer

class MyMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    MyMailer.confirmation_instructions(User.first, 'faketoken', {})
  end

  def reset_password_instructions
    MyMailer.reset_password_instructions(User.first, 'faketoken', {})
  end

  def unlock_instructions
    MyMailer.unlock_instructions(User.first, 'faketoken', {})
  end
end
