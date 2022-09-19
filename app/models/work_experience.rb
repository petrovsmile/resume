# frozen_string_literal: true

class WorkExperience < ApplicationRecord
  validates :company_name, :post, :city, :start_work, :what_did_do, :what_learned, presence: true

  has_and_belongs_to_many :stacks

  def range_of_work_position(start_date,finish_date)
    start_date = start_date.beginning_of_month
    finish_date = finish_date.end_of_month
    self.finish_work ||= Time.new
    main_range_in_months = RangeInMonths.get(start_date, finish_date)
    work_range_in_months = RangeInMonths.get(self.start_work.beginning_of_month, self.finish_work.end_of_month)
    range_from_main_start_to_work_start = RangeInMonths.get(start_date, self.start_work.beginning_of_month)
    {
      width: (work_range_in_months.to_f / main_range_in_months.to_f) * 100,
      left: (range_from_main_start_to_work_start.to_f / main_range_in_months.to_f) * 100,
    }
  end


end
