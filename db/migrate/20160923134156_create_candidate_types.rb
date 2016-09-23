class CreateCandidateTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_types do |t|
      t.string :name
      t.integer :points_confirmed
      t.integer :points_rejected
      t.integer :points_success
      t.integer :points_failure

      t.timestamps
    end
  end
end
