class CreateMessageVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :message_votes do |t|
      t.boolean :positive
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :message, foreign_key: true, null: false

      t.timestamps
    end
  end
end
