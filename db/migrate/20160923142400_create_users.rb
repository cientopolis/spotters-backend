class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      t.string :sub, null: false
      t.string :name
      t.string :email

      t.boolean :tutorial, :default => false, :null => false
      t.string :role, :default => 'user', :null => false

      t.timestamps
      t.index :sub, unique: true
    end
  end
end
