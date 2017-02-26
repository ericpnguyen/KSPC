class AddAttachmentMediaToArchives < ActiveRecord::Migration
  def self.up
    change_table :archives do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :archives, :media
  end
end
