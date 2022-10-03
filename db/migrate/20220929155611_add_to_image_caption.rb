class AddToImageCaption < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :caption, :string
  end
end
