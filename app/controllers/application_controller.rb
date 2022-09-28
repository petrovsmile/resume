# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_joystick

  private 

  def initialize_joystick

    @joystick = Joystick.find_by(hash_code: cookies[:joystick_hash])

    if @joystick.blank?
      hash = Digest::MD5.new.hexdigest Time.new.to_s

      @joystick = Joystick.create(
        hash_code: hash
      )
      cookies[:joystick_hash] = hash
    end
  end

end
