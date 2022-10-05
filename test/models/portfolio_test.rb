# frozen_string_literal: true

# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer
#  web_site   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
