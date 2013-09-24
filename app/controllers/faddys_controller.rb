class FaddysController < ApplicationController

  def index
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

end
