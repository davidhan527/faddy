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

    @desserts_sorted = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
    @desserts_tags = ["dessert", "desserts", "sweet", "chocolate", "cake", "icecream", "dessertporn", "delish", "sweettooth"]
    @tag_filter = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
  end

  def drinks
    client = Instagram.client(:access_token => session[:access_token])      
    location = params[:location]
    results = find_results(location)

    @drinks_sorted = results.sort_by {|hash| hash.likes["count"]}.uniq.reverse! #first(15)
    @drinks_tags = ["drink", "drinks", "slurp", "pub", "bar", "liquor", "thirst", "thirsty", "cocktail", "cocktails", "drinkup", "glass", "beer", "beers", "wine"]
    @tag_filter = ["dog", "sexy", "fashion", "swag", "funny", "gay"]
  end

end
