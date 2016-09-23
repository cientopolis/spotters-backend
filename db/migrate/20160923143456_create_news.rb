class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :text
      t.belongs_to :author, index: true, null: false

      t.timestamps
    end

    add_foreign_key :news, :admins, column: :author_id
  end
end
