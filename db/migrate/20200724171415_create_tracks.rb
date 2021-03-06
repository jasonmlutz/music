class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :regular, default: true

      t.index :album_id

      t.timestamps
    end
  end
end
