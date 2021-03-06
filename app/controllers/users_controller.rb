class UsersController < ApplicationController

  def authorize_spotify_user
    @spotify_user_response = RSpotify::User.new(request.env['omniauth.auth'])

    @user = User.find_or_initialize_by(
      spotify_id: @spotify_user_response.id
    )
    binding.pry
    if !@user.persisted?
      @user.name = @spotify_user_response.display_name
    end

    @user.spotify_access_token = @spotify_user_response.credentials.token
    @user.spotify_user_hash = @spotify_user_response.to_json
    @user.save!
    # get most recent playlist unless it already exists for this week...
    # get_most_recent_playlist

    redirect_to user_playlists_path(@user.id)
  end


  private

  def get_most_recent_playlist
    discover_weekly_playlist_data = @spotify_user_response.playlists.find { |p| p.name == "Discover Weekly" }

    Playlist.find_or_create_by_response_data(@user, discover_weekly_playlist_data)
  end

end
