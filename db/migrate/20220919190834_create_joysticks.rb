class CreateJoysticks < ActiveRecord::Migration[7.0]
  def change
    create_table :joysticks do |t|
      t.string :hash_code
      t.timestamps
    end
  end
end
