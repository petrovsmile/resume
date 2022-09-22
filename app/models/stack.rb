# frozen_string_literal: true

# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stack < ApplicationRecord
  has_and_belongs_to_many :work_experiences
  #has_and_belongs_to_many :portfolios
end
