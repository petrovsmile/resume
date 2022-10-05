# frozen_string_literal: true

class JoysticksController < ApplicationController
  def event
    ActionCable.server.broadcast "joystick_channel_#{params[:hash_code]}", { buttonCode: params[:buttonCode] }

    render json: 'ok'
  end

  def show
    @joystick = Joystick.find_by(hash_code: params[:hash_code])
  end
end
