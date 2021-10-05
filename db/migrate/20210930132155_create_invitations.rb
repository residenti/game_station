class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :club, null: false, foreign_key: true
      t.string :token, null: false
      t.boolean :used, null: false, default: false

      t.timestamps
    end

    add_index :invitations, :token, unique: true
  end
end
