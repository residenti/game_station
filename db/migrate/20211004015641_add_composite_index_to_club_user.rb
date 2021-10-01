class AddCompositeIndexToClubUser < ActiveRecord::Migration[6.1]
  def change
    add_index :club_users, [:club_id, :user_id], unique: true
  end
end
