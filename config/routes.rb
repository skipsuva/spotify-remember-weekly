Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'

  get '/auth/spotify/callback', to: 'users#authorize_spotify_user'
  
end
