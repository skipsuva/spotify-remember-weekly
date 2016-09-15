class UsersController < ApplicationController

  def authorize_spotify_user
    @spotify_user_response = RSpotify::User.new(request.env['omniauth.auth'])

    @user = User.find_or_initialize_by(name: @spotify_user_response.display_name, spotify_id: @spotify_user_response.id, spotify_access_token: @spotify_user_response.credentials.token)

    if !@user.persisted?
      @user.spotify_user_hash = @spotify_user_response.to_json
      save_first_playlist

      @user.save!
    end
    # redirect to playlists show
  end


  private

  def save_first_playlist
    discover_weekly_playlist_data = @spotify_user_response.playlists.find { |p| p.name == "Discover Weekly" }

    playlist = Playlist.find_or_initialize_by(spotify_id: discover_weekly_playlist_data.id)
    playlist.user_id = @user.id
    playlist.date = Time.now

    playlist.save!
  end

end
