class CreateArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :archives do |t|
      t.text :title

      t.timestamps
    end
  end
end
