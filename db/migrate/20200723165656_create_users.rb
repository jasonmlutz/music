class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digets, null: false
      t.string :session_token, null: false

      t.index :email, unique: true
      t.index :session_token
      t.timestamps
    end
  end
end
