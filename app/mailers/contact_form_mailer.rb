# frozen_string_literal: true

class ContactFormMailer < ApplicationMailer
  default from: 'ПЕРВИЧКА.PRO <notification@pervichka.pro>'

  def send_form(message)
    @message = message
    mail(to: 'hello@petrov-smile.ru', subject: 'Написали с сайта petrov-smile.ru')
  end
end
