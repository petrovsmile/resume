class AddToWorkExperiencesPeriod < ActiveRecord::Migration[7.0]
  def change
    add_column :work_experiences, :period, :string
  end
end
