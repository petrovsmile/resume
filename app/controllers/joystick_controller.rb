class JoystickController < ApplicationController
  def event
    ActionCable.server.broadcast "joystick", { message: 'ok' }

    render json: 'ok'
  end
end
