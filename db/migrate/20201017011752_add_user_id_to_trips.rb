class AddUserIdToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :user_id, :integer
    add_index :trips, :user_id
  end
end
