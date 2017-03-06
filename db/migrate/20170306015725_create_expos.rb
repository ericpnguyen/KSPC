class CreateExpos < ActiveRecord::Migration[5.0]
  def change
    create_table :expos do |t|
      t.text :content

      t.timestamps
    end
  end
end
