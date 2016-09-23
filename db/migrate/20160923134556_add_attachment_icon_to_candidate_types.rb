class AddAttachmentIconToCandidateTypes < ActiveRecord::Migration
  def self.up
    change_table :candidate_types do |t|
      t.attachment :icon_unknown
      t.attachment :icon_negative_confirmed
      t.attachment :icon_negative_rejected
      t.attachment :icon_negative_unknown
      t.attachment :icon_positive_confirmed
      t.attachment :icon_positive_rejected
      t.attachment :icon_positive_unknown
    end
  end

  def self.down
    remove_attachment :candidate_types, :icon_unknown
    remove_attachment :candidate_types, :icon_negative_confirmed
    remove_attachment :candidate_types, :icon_negative_rejected
    remove_attachment :candidate_types, :icon_negative_unknown
    remove_attachment :candidate_types, :icon_positive_confirmed
    remove_attachment :candidate_types, :icon_positive_rejected
    remove_attachment :candidate_types, :icon_positive_unknown
  end
end
