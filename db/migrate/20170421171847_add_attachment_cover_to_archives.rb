class AddAttachmentCoverToArchives < ActiveRecord::Migration
  def self.up
    change_table :archives do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :archives, :cover
  end
end
