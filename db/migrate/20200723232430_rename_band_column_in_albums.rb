class RenameBandColumnInAlbums < ActiveRecord::Migration[6.0]
  def change
    rename_column :albums, :band, :band_id
  end
end
