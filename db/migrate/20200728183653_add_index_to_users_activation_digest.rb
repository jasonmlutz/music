class AddIndexToUsersActivationDigest < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :activation_token_digest
  end
end
