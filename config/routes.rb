Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get '/:user_id', to: 'playlists#index', as: 'user_playlists'

  get '/auth/spotify/callback', to: 'users#authorize_spotify_user'

end
