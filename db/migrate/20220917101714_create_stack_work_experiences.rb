class CreateStackWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    create_join_table :stacks, :work_experiences do |t|

      t.timestamps
    end
  end
end
