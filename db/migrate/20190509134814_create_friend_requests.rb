class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :requester
      t.references :requested

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :requester_id
    add_foreign_key :friend_requests, :users, column: :requested_id

    add_index :friend_requests, [:requester_id, :requested_id], unique: true
  end
end
