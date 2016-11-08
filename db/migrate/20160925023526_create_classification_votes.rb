class CreateClassificationVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :classification_votes do |t|
      t.boolean :positive, null: false, default: true
      t.references :classification, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
