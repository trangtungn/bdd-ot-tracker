# frozen_string_literal: true

# using config.autoload_paths << 'lib' instead
# require 'twilio-ruby'

module SmsTool
  def self.send_sms(number:, message:)
    @client = Twilio::REST::Client.new ENV.fetch('TWILIO_ACCOUNT_SID', nil), ENV.fetch('TWILIO_AUTH_TOKEN', nil)

    @client.messages.create(
      from: ENV.fetch('TWILIO_PHONE_NUMBER', nil),
      to: number,
      body: message
    )
  end
end
