# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @work_experiences = WorkExperience.all.order(start_work: :asc)
    @work_experiences_start_date = Date.parse('2013-01-01')
    @work_experiences_finish_date = Date.today.end_of_month
    if @work_experiences_finish_date < @work_experiences.last.finish_work
      @work_experiences_finish_date = @work_experiences.last.finish_work + 1.month
    end

    @contacts = Contact.all.order(position: :asc)
  end
end
