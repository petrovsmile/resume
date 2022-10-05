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
class Portfolio < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :stacks
  has_many :images, dependent: :destroy, as: :object

  has_rich_text :description
end
