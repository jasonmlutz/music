class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password_digets, :password_digest
  end
end
