class CreateClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :classifications do |t|
      t.belongs_to :candidate, foreign_key: true, null: false
      t.jsonb :data

      t.timestamps
    end
  end
end
