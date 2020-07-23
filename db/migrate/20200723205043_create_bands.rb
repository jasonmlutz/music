class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.index :name
      t.timestamps
    end
  end
end
