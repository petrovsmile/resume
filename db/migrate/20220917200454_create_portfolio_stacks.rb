class CreatePortfolioStacks < ActiveRecord::Migration[7.0]
  def change
    create_join_table :portfolios, :stacks do |t|

      t.timestamps
    end
  end
end
