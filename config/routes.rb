Faddy::Application.routes.draw do

  resources :locations

  root :to => "sessions#index"

  get 'oauth/callback', :to => 'sessions#new'

  get '/location', :to => 'faddys#new'

  get '/food', :to => 'faddys#food'
 
  get '/desserts', :to => 'faddys#desserts'

  get '/drinks', :to => 'faddys#drinks'
=begin

oauth_callbackGET    /oauth/callback(.:format)     sessions#new
               GET    /location(.:format)           faddys#new
          food GET    /food(.:format)               faddys#food
      desserts GET    /desserts(.:format)           faddys#desserts
        drinks GET    /drinks(.:format)             faddys#drinks
=end

# root :to => 'faddys#index'

# get '/faddys', :to => 'faddys#connect'

# post '/faddys', :to => 'faddys#callback'

# get "/oauth/connect" do
#   redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
# end

# get "/oauth/callback" do
#   response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
#   session[:access_token] = response.access_token
#   redirect_to root_path
# end

# get "/feed" do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user

#   html = "<h1>#{user.username}'s recent photos</h1>"
#   for media_item in client.user_recent_media
#     html << "<img src='#{media_item.images.thumbnail.url}'>"
#   end
#   html
# end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
