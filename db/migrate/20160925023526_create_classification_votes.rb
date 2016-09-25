class CreateClassificationVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :classification_votes do |t|
      t.boolean :positive
      t.references :classification, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
