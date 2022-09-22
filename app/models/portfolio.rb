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
class Portfolio < ApplicationRecord
  validates :name, :web_site, :preview, :description, presence: :true
  
  has_and_belongs_to_many :stacks
  has_many :images, as: :object
  
end
