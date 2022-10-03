# frozen_string_literal: true

class IndexController < ApplicationController
  before_action :initialize_joystick

  def index
    @work_experiences = WorkExperience.all.order(start_work: :asc)
    @work_experiences_start_date = Date.parse('2013-01-01')
    @work_experiences_finish_date = Date.today.end_of_month
    if @work_experiences_finish_date < @work_experiences.last.finish_work
      @work_experiences_finish_date = @work_experiences.last.finish_work + 1.month
    end

    @portfolios = Portfolio.all.order(position: :asc)

    @contacts = Contact.all.order(position: :asc)
  end
  
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
