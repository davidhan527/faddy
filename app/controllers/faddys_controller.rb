class FaddysController < ApplicationController

  def new

    client = Instagram.client(:access_token => session[:access_token])
    # redirect_to '/feed'

    
    # food = Instagram.tag_recent_media('foodporn')
    
    #######################

    # Instagram.media_search("37.7808851","-122.3948632")
    ### Geocoder.coordinates("times square")


    # binding.pry
    def feed
      client = Instagram.client(:access_token => session[:access_token])


    page_1 = Instagram.tag_recent_media('food')
    page_2_max_id = page_1.pagination.next_max_id
    page_2 = Instagram.tag_recent_media('food', :max_id => page_2_max_id ) unless page_2_max_id.nil?
    page_3_max_id = page_2.pagination.next_max_id
    page_3 = Instagram.tag_recent_media('food', :max_id => page_3_max_id ) unless page_2_max_id.nil?
    food = page_1 + page_2 + page_3
    @food_sorted = food.sort_by {|hash| hash.likes["count"]}.reverse!.first(15)
    end


        
  end


end
