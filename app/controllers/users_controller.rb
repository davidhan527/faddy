class UserController < ApplicationController

  def index
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 


    client = Instagram.client(:access_token => session[:access_token])
    if (params[:username] == client.user.username)
      @user = client.user
      @recent_media_items = client.user_recent_media(:count => 50)
      @token = session[:access_token]
    else
      @searchedUser = Instagram.user_search(params[:username])
      @user = @searchedUser.first
      @recent_media_items = Instagram.user_recent_media(@searchedUser.first[:id], :access_token => session[:access_token])
      @token = Instagram.user_search(params[:username])
    end

  end
  
end
