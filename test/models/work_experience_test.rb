# frozen_string_literal: true

# == Schema Information
#
# Table name: work_experiences
#
#  id           :bigint           not null, primary key
#  company_name :string
#  city         :string
#  web_site     :string
#  description  :text
#  post         :string
#  start_work   :date
#  finish_work  :date
#  what_did_do  :text
#  what_learned :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class WorkExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
