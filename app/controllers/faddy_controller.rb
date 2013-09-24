class FaddyController < ApplicationController

enable :sessions

# CALLBACK_URL = "http://hidden-hamlet-7511.herokuapp.com/"

#   Instagram.configure do |config|
#     config.client_id = "7ffb6e89a4e74a23b0dc42b0ad6a6588"
#     config.client_secret = "1d9bcb7f338c490f8136cdfa133b5bbd"
#   end

  def index
    # Instagram.configure do |config|
    #   config.client_id = '7ffb6e89a4e74a23b0dc42b0ad6a6588'
    #   # config.access_token = ''
    # end
    
  # https://api.instagram.com/v1/media/popular?client_id='7ffb6e89a4e74a23b0dc42b0ad6a6588'
  end

  def connect
    # CALLBACK_URL = "http://localhost:4567/oauth/callback"
    # redirect_to Instagram.authorize_url(:redirect_uri => INSTAGRAM_CONFIG['callback_url'])
  end

  def callback
    # CALLBACK_URL = "http://localhost:4567/oauth/callback"
    # response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    # session[:access_token] = response.access_token
    # redirect_to "/"
  end

end
