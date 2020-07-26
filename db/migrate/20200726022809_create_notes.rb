class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :author_id, null: false
      t.integer :track_id, null: false
      t.text :body, null: false

      t.index :author_id
      t.index :track_id

      t.timestamps
    end
  end
end
