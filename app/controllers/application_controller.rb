# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :my_action

  private 

  def my_action
    if cookies[:joystick_id].present?
      @joystick = Joystick.find(cookies[:joystick_id])
    else
      @joystick = Joystick.create
      cookies[:joystick_id] = @joystick.id
    end
    
  end
end
