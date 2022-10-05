# frozen_string_literal: true

class FormController < ApplicationController
  def send_form
    Form::Sender.new(
      name: params[:name],
      email: params[:email],
      message: params[:message],
      senders: [Form::Tlgrm, Form::Email]
    ).send

    render plain: 'ok'
  end
end
