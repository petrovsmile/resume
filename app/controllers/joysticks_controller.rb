class JoysticksController < ApplicationController
  def show
    @joystick = Joystick.find(params[:id])
  end
end
