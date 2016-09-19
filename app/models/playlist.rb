class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :tracks

  def self.find_or_create_by_response_data(user, playlist_data)
    new_playlist = self.find_or_initialize_by(spotify_id: playlist_data.id)

    new_playlist.user_id = user.id
    new_playlist.date = Time.now

    new_playlist.save!

    Track.find_or_create_by_response_data(new_playlist.id, playlist_data.tracks)
  end

  def display_date
    date.strftime('%F')
  end
end
