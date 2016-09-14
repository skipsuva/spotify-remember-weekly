class UsersController < ApplicationController

  def authorize_spotify_user
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    @user = User.find_or_initialize_by(name: spotify_user.display_name, spotify_id: spotify_user.id, spotify_access_token: spotify_user.token)
    binding.pry
  end

end
