class FaddysController < ApplicationController

  def index
    client = Instagram.client(:access_token => session[:access_token])
      user = client.user

    html = "<h1>#{user.username}'s recent photos</h1>"
  for media_item in client.user_recent_media
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
  end

end
