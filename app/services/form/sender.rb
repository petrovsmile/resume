# frozen_string_literal: true

module Form
  class Sender
    def initialize(name:, email:, message:, senders: [])
      @name = name
      @email = email
      @message = message
      @senders = senders
    end

    def send
      @senders.each do |sender|
        sender.new(
          message: text_message(@name, @email, @message)
        ).send
      end
    end

    private

    def text_message(name, email, message)
      text_message = 'Написали с сайта petrov-smile.ru<br>'
      text_message += "Имя: #{name}<br>"
      text_message += "Email: #{email}<br>"
      text_message += "Сообщение: #{message}<br>"
    end
  end
end
