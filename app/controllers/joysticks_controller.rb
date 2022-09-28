class JoysticksController < ApplicationController
  def event
    ActionCable.server.broadcast "joystick_channel_#{@joystick.hash_code}", { buttonCode: params[:buttonCode] }

    render json: 'ok'
  end
  
  def show
  end
end
