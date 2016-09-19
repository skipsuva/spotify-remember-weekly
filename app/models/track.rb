class Track < ActiveRecord::Base
  # has_many :playlists

  def self.find_or_create_by_response_data(playlist_id, tracks_data)
    binding.pry
    tracks_data.each do |track|
      song = Track.find_or_initialize_by(spotify_id: track.id)

      song.playlist_id = playlist_id
      song.title = track.name
      song.artist = track.artists.first.name
      song.external_link = track.external_urls['spotify']
      song.album = track.album.name
      song.image_url = track.album.images.find {|i| i['height'] == 300 }['url'] if track.album.images.find {|i| i['height'] == 300 }
      song.length = track.duration_ms

      song.save!
    end
    binding.pry
  end

  def join_artist_names(artists_array)

  end
end
