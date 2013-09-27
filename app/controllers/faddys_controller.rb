class FaddysController < ApplicationController


    def new

    client = Instagram.client(:access_token => session[:access_token])

    end 

    # redirect_to '/feed'    
    def food
      client = Instagram.client(:access_token => session[:access_token])

    location = params[:location]
    coordinates = Geocoder.coordinates("#{location}")
  
    x = coordinates[0]
    y = coordinates[1]

    loc = Instagram.media_search("#{x}","#{y}", options = {:count => 100})
    loc_top = Instagram.media_search("#{x + 0.012}","#{y}", options = {:count => 100})
    loc_bottom = Instagram.media_search("#{x - 0.012}","#{y}", options = {:count => 100})
    loc_right = Instagram.media_search("#{x}","#{y - 0.012}", options = {:count => 100})
    loc_left = Instagram.media_search("#{x}","#{y + 0.012}", options = {:count => 100})

    results = loc + loc_top + loc_bottom + loc_left + loc_right
    

        @food_sorted = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
        @food_tags = ["food", "foodporn", "yum", "yummy", "foodie", "instafood", "dinner", "lunch", "breakfast", "tasty", "delish", "delicious", "eating", "foodpic", "foodpics", "eat", "foodgasm", "foods"]
        @tag_filter = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
        @which_num = 2
        # binding.pry
    
    end
    

    def desserts

    client = Instagram.client(:access_token => session[:access_token])
    location = params[:location]
    coordinates = Geocoder.coordinates("#{location}")
  
    x = coordinates[0]
    y = coordinates[1]

    loc = Instagram.media_search("#{x}","#{y}", options = {:count => 100})
    loc_top = Instagram.media_search("#{x + 0.012}","#{y}", options = {:count => 100})
    loc_bottom = Instagram.media_search("#{x - 0.012}","#{y}", options = {:count => 100})
    loc_right = Instagram.media_search("#{x}","#{y - 0.012}", options = {:count => 100})
    loc_left = Instagram.media_search("#{x}","#{y + 0.012}", options = {:count => 100})

    results = loc + loc_top + loc_bottom + loc_left + loc_right
    
    # binding.pry

        @desserts_sorted = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
        @desserts_tags = ["dessert", "desserts", "sweet", "chocolate", "cake", "icecream", "dessertporn", "delish", "sweettooth"]
        @tag_filter = ["dog", "sexy", "fashion", "swag"]

        #dessert #food #desserts #TagsForLikes #yum #yummy #amazing #instagood #instafood #sweet #chocolate #cake #icecream #dessertporn #delish #foods #delicious #tasty #eat #eating #hungry #foodpics #sweettooth

    end

    def drinks
        client = Instagram.client(:access_token => session[:access_token])
    location = params[:location]
    coordinates = Geocoder.coordinates("#{location}")
  
    x = coordinates[0]
    y = coordinates[1]

    loc = Instagram.media_search("#{x}","#{y}", options = {:count => 100})
    loc_top = Instagram.media_search("#{x + 0.012}","#{y}", options = {:count => 100})
    loc_bottom = Instagram.media_search("#{x - 0.012}","#{y}", options = {:count => 100})
    loc_right = Instagram.media_search("#{x}","#{y - 0.012}", options = {:count => 100})
    loc_left = Instagram.media_search("#{x}","#{y + 0.012}", options = {:count => 100})

    results = loc + loc_top + loc_bottom + loc_left + loc_right
    
    # binding.pry

        @drinks_sorted = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
        @drinks_tags = ["drink", "drinks", "slurp", "pub", "bar", "liquor", "thirst", "thirsty", "cocktail", "cocktails", "drinkup", "glass", "beer", "beers", "wine"]
        @tag_filter = ["dog", "sexy", "fashion", "swag"]



    
    end


end
