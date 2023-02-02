# frozen_string_literal: true

# using config.autoload_paths << 'lib' instead
# require 'twilio-ruby'

module SmsTool
  def self.send_sms(number:, message:)
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: message
    )
  end
end
