class AddAttachmentIconToLevels < ActiveRecord::Migration
  def self.up
    change_table :levels do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :levels, :icon
  end
end
