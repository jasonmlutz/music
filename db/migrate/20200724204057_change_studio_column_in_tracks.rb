class ChangeStudioColumnInTracks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tracks, :regular, :bonus
    change_column_default :tracks, :bonus, from: true, to: false
  end
end
