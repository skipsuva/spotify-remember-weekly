class PlaylistsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @playlists = Playlist.where(user_id: @user.id)
  end

end
