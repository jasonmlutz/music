class AddNewUserColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activated, :boolean, default: false, null: false
    add_column :users, :activation_token_digest, :string
  end
end
