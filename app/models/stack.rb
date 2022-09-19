# frozen_string_literal: true

class Stack < ApplicationRecord
  has_and_belongs_to_many :work_experiences
  #has_and_belongs_to_many :portfolios
end
