class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :code
      t.text :content
      t.timestamps
    end
  end
end
