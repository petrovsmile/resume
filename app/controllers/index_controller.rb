# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @work_experiences = WorkExperience.all.order(start_work: :asc)
    @work_experiences_start_date = Date.parse('2013-01-01')
    @work_experiences_finish_date = Date.today.end_of_month
  end
end
