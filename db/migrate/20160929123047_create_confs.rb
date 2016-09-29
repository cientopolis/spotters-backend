class CreateConfs < ActiveRecord::Migration[5.0]
  def change
    create_table :confs do |t|
      t.string :title
      t.integer :zoom
      t.st_point :center, geographic: true
      t.float :heading_center
      t.float :pitch_center
      t.st_polygon :bounds, geographic: true
      t.integer :proximity_distance

      t.timestamps
    end

    add_index :confs, :center, using: :gist
    add_index :confs, :bounds, using: :gist
  end
end
