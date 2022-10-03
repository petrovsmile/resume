class RemoveDescriptionTexts < ActiveRecord::Migration[7.0]
  def change
    remove_column :work_experiences, :description
    remove_column :work_experiences, :what_did_do
    remove_column :work_experiences, :what_learned

    remove_column :portfolios, :description
    remove_column :portfolios, :what_did_do
    remove_column :portfolios, :what_learned
  end
end
