class CreateTutorialSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorial_steps do |t|
      t.string :title
      t.text :text
      t.integer :position

      t.timestamps
    end
  end
end
