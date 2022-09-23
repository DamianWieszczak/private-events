class DropInvitation < ActiveRecord::Migration[7.0]
  def change
    drop_table :invitations
  end
end
