class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :spotify_id
      t.string :title
      t.string :artist
      t.string :album
      t.string :external_link
      t.string :image_url
      t.integer :length
    end
  end
end
