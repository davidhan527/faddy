class SessionsController < ApplicationController

  def index
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def new
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to "/location"
  end


end
