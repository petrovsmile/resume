# frozen_string_literal: true

class IndexController < ApplicationController
  before_action :initialize_joystick

  def index
    @work_experiences = WorkExperience.all.order(start_work: :desc)
    @work_experiences_start_date = Date.parse('2011-01-01')
    @work_experiences_finish_date = Time.zone.today.end_of_month
    if @work_experiences_finish_date < @work_experiences.last.finish_work
      @work_experiences_finish_date = @work_experiences.last.finish_work + 1.month
    end

    @portfolios = Portfolio.all.order(position: :asc)
    @contacts = Contact.all.order(position: :asc)
  end

  private

  def initialize_joystick
    @joystick = Joystick.find_by(hash_code: cookies[:joystick_hash])

    return if @joystick.blank?

    hash = Digest::MD5.new.hexdigest Time.zone.now.to_s

    @joystick = Joystick.create(
      hash_code: hash
    )
    cookies[:joystick_hash] = hash
  end
end
