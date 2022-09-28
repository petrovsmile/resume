class JoystickChannel < ApplicationCable::Channel

  def subscribed
    stream_from "joystick_channel_#{params[:joystick_channel]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
