class FaddysController < ApplicationController

  def food
    client = Instagram.client(:access_token => session[:access_token])      
    location = params[:location]
    results = find_results(location)

    @sorted_results = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
    @food_tags = ["food", "foodporn", "yum", "yummy", "foodie", "instafood", "dinner", "lunch", "breakfast", "tasty", "delish", "delicious", "eating", "foodpic", "foodpics", "eat", "foodgasm", "foods"]
    @filter_tags = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
  end

  def desserts
    client = Instagram.client(:access_token => session[:access_token])      
    location = params[:location]
    results = find_results(location)

    @sorted_results = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
    @food_tags = ["dessert", "desserts", "sweet", "chocolate", "cake", "icecream", "dessertporn", "delish", "sweettooth"]
    @filter_tags = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
  end

  def drinks
    client = Instagram.client(:access_token => session[:access_token])      
    location = params[:location]
    results = find_results(location)

    @sorted_results = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
    @food_tags = ["drink", "drinks", "slurp", "pub", "bar", "liquor", "thirst", "thirsty", "cocktail", "cocktails", "drinkup", "glass", "beer", "beers", "wine"]
    @filter_tags = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
  end

private

  def find_results(location)
    coordinates = Geocoder.coordinates("#{location}")
  
    x = coordinates[0]
    y = coordinates[1]

    loc = Instagram.media_search("#{x}","#{y}", options = {:count => 100})
    loc_top = Instagram.media_search("#{x + 0.012}","#{y}", options = {:count => 100})
    loc_bottom = Instagram.media_search("#{x - 0.012}","#{y}", options = {:count => 100})
    loc_right = Instagram.media_search("#{x}","#{y - 0.012}", options = {:count => 100})
    loc_left = Instagram.media_search("#{x}","#{y + 0.012}", options = {:count => 100})

    results = loc + loc_top + loc_bottom + loc_left + loc_right
  end

end
