Faddy::Application.routes.draw do

  resources :locations

  root :to => "sessions#index"

  get 'oauth/callback', :to => 'sessions#new'

  get '/location', :to => 'faddys#new'

  get '/food', :to => 'faddys#food'
 
  get '/desserts', :to => 'faddys#desserts'

  get '/drinks', :to => 'faddys#drinks'

end
