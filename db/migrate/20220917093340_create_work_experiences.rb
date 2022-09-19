class CreateWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :work_experiences do |t|
      t.string :company_name
      t.string :city
      t.string :web_site
      t.text :description
      t.string :post
      t.date :start_work
      t.date :finish_work
      t.text :what_did_do
      t.text :what_learned
      
      t.timestamps
    end
  end
end
