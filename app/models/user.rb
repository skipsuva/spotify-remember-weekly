class User < ActiveRecord::Base
  has_many :playlists

  def spotify_user_hash
    JSON.parse(super)
  end

end
