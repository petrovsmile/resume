# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  code       :string
#  position   :integer
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
  validates :value, presence: true
end
