class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year
      t.integer :band
      t.boolean :studio, default: true

      t.index :band
      t.timestamps
    end
  end
end
