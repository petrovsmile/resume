class JoystickController < ApplicationController
  def event
    ActionCable.server.broadcast "joystick_events", { buttonCode: params[:buttonCode] }

    render json: 'ok'
  end
end
