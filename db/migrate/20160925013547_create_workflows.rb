class CreateWorkflows < ActiveRecord::Migration[5.0]
  def change
    create_table :workflows do |t|
      t.string :name
      t.integer :points_confirmed, null: false, default: 0
      t.integer :points_rejected, null: false, default: 0
      t.integer :points_success, null: false, default: 0
      t.integer :points_failure, null: false, default: 0

      t.timestamps
    end
  end
end
