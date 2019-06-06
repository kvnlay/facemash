class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :adder
      t.references :added

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :adder_id
    add_foreign_key :friendships, :users, column: :added_id

    add_index :friendships, [:adder_id, :added_id], unique: true
  end
end
