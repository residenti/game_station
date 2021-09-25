class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :nickname, null: false
      t.string :name, null: false
      t.string :profile_icon_url, null: false

      t.timestamps
    end

    add_index :users, :uid, unique: true
    add_index :users, :nickname, unique: true
  end
end
