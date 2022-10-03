class RemoveFormPortfolioPreview < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :preview
  end
end
