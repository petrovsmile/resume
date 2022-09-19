class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :web_site
      t.text :preview
      t.text :description
      t.text :what_did_do
      t.text :what_learned
      t.timestamps
    end
  end
end
