class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :code
      t.string :value
      t.integer :position
      t.timestamps
    end
  end
end
