class JoysticksController < ApplicationController
  def event
    JoystickChannel.broadcast_to "joystick_events", { buttonCode: params[:buttonCode] }

    render json: 'ok'
  end
  
  def show
    @joystick = Joystick.find(params[:id])
  end
end
