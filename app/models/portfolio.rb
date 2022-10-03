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
  validates :name, :web_site, :description, presence: :true
  
  has_and_belongs_to_many :stacks
  has_many :images, as: :object
  
  has_rich_text :description
  has_rich_text :what_did_do
  has_rich_text :what_learned
  
end
