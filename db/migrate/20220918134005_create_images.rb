class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :object, polymorphic: true
      t.timestamps
    end
  end
end
