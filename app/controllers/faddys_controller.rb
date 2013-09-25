class FaddysController < ApplicationController


    def new

    client = Instagram.client(:access_token => session[:access_token])

    end 

    # redirect_to '/feed'


    
    def feed
      client = Instagram.client(:access_token => session[:access_token])

    location = params[:location]
    coordinates = Geocoder.coordinates("#{location}")
  
    x = coordinates[0]
    y = coordinates[1]

    loc = Instagram.media_search("#{x}","#{y}", options = {:count => 100})
    loc_top = Instagram.media_search("#{x + 0.006}","#{y}", options = {:count => 100})
    loc_bottom = Instagram.media_search("#{x - 0.006}","#{y}", options = {:count => 100})

    results = loc + loc_top + loc_bottom

    # binding.pry
    # page_1 = Instagram.media_search(x, y)
    # page_2_max_id = page_1.pagination.next_max_id
    # page_2 = Instagram.media_search(x, y, :max_id => page_2_max_id ) unless page_2_max_id.nil?
    # page_3_max_id = page_2.pagination.next_max_id
    # page_3 = Instagram.media_search(x, y, :max_id => page_3_max_id ) unless page_2_max_id.nil?
    # food = page_1 + page_2 + page_3 

    # page_1 = Instagram.tag_recent_media('food')
    # page_2_max_id = page_1.pagination.next_max_id
    # page_2 = Instagram.tag_recent_media('food', :max_id => page_2_max_id ) unless page_2_max_id.nil?
    # page_3_max_id = page_2.pagination.next_max_id
    # page_3 = Instagram.tag_recent_media('food', :max_id => page_3_max_id ) unless page_2_max_id.nil?
    # food = page_1 + page_2 + page_3
        @food_sorted = results.sort_by {|hash| hash.likes["count"]}.reverse! #first(15)

    
    end


        



end
