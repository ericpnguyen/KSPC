class AddFeaturedToArchive < ActiveRecord::Migration[5.0]
  def change
    add_column :archives, :featured, :boolean
  end
end
