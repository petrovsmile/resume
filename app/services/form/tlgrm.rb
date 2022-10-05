# frozen_string_literal: true

module Form
  class Tlgrm
    def initialize(message:)
      @message = message
    end

    def send
      message = convert(@message)
      TlgrmApi.new.send_message(message)
    end

    private

    def convert(message)
      message.gsub('<br>', "\n")
    end
  end
end
