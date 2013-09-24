class FaddysController < ApplicationController

  def index
    client = Instagram.client(:access_token => session[:access_token])
      @user = client.user

    
  end


end
