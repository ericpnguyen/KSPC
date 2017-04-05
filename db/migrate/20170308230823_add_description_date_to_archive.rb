class AddDescriptionDateToArchive < ActiveRecord::Migration[5.0]
  def change
    add_column :archives, :description, :string
    add_column :archives, :date, :date
  end
end
