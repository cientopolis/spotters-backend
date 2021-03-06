class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.integer :status, default: 0, null: false
      t.st_point :location, geographic: true
      t.float :heading
      t.float :pitch
      t.belongs_to :owner, index: true, null: false
      t.belongs_to :expert, index: true

      t.timestamps
    end

    add_index :candidates, :location, using: :gist
    add_foreign_key :candidates, :users, column: :owner_id
    add_foreign_key :candidates, :users, column: :expert_id
  end
end
