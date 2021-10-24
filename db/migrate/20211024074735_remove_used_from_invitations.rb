class RemoveUsedFromInvitations < ActiveRecord::Migration[6.1]
  def change
    remove_column :invitations, :used, :boolean
  end
end
