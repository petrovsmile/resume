# frozen_string_literal: true

require 'net/http'

class TlgrmApi
  def send_message(message)
    url = "https://api.telegram.org/bot1054404608:#{Rails.application.credentials.dig(:tlgrm, :token)}/sendMessage"

    Net::HTTP.post_form(
      URI.parse(url),
      'chat_id' => 419_182_110,
      'text' => message
    )
  end
end
