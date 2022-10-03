# frozen_string_literal: true

# == Schema Information
#
# Table name: work_experiences
#
#  id           :bigint           not null, primary key
#  city         :string
#  company_name :string
#  finish_work  :date
#  post         :string
#  start_work   :date
#  web_site     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class WorkExperience < ApplicationRecord
  validates :company_name, :post, :city, :start_work, presence: true

  has_and_belongs_to_many :stacks

  has_rich_text :description
  has_rich_text :what_did_do
  has_rich_text :what_learned

  def range_of_work_position(start_date,finish_date)
    start_date = start_date.beginning_of_month
    finish_date = finish_date.end_of_month
    self.finish_work ||= Time.new
    main_range_in_months = RangeInMonths.new(start_date, finish_date).call
    work_range_in_months = RangeInMonths.new(self.start_work.beginning_of_month, self.finish_work.end_of_month).call
    range_from_main_start_to_work_start = RangeInMonths.new(start_date, self.start_work.beginning_of_month).call
    {
      width: (work_range_in_months.to_f / main_range_in_months.to_f) * 100,
      left: (range_from_main_start_to_work_start.to_f / main_range_in_months.to_f) * 100,
    }
  end


end
