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
require 'test_helper'

class WorkExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
