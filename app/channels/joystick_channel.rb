class JoystickChannel < ApplicationCable::Channel

  

  def subscribed
    stream_from "joystick_events"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
