# == Schema Information
#
# Table name: portfolios
#
#  id           :bigint           not null, primary key
#  name         :string
#  web_site     :string
#  preview      :text
#  description  :text
#  what_did_do  :text
#  what_learned :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
