# frozen_string_literal: true

module Form
  class Email
    def initialize(message:)
      @message = message
    end

    def send
      ContactFormMailer.send_form(@message).deliver_now
    end
  end
end
