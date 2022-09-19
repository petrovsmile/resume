class Portfolio < ApplicationRecord
  validates :name, :web_site, :preview, :description, presence: :true
  
  has_and_belongs_to_many :stacks
  has_many :images, as: :object
  
end
