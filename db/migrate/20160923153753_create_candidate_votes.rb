class CreateCandidateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_votes do |t|
      t.boolean :positive
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :candidate, foreign_key: true, null: false

      t.timestamps
    end
  end
end
