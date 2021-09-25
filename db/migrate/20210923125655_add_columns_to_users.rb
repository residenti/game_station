class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string, after: :locked_at
    add_column :users, :uid, :string, after: :locked_at
    add_column :users, :username, :string, after: :locked_at
  end
end
