class CreateClubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :club_users do |t|
      t.references :club, null: false
      t.references :user, null: false
      t.boolean :ownered, null: false

      t.timestamps
    end
  end
end
