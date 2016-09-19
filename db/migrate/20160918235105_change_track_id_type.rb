class ChangeTrackIdType < ActiveRecord::Migration
  def change
    change_column :tracks, :spotify_id, :string
  end
end
