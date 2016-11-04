
class Recipe
  attr_reader :servings, :uri, :label, :link, :ingredients, :image, :servings, :health_labels, :bookmarked
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]
  BASE_URL = "https://api.edamam.com/search?"


  def initialize(uri, label, link, ingredients, image, health_labels, servings, bookmarked)
    if uri == nil || label == nil || link == nil || ingredients == nil || image == nil || uri == "" || label == "" || link == "" || ingredients == "" || image == ""
      raise ArgumentError
    end

    @uri = uri
    @label = label
    @link = link
    @ingredients = ingredients
    @image = image
    @servings = servings
    @health_labels = health_labels
    @bookmarked = bookmarked
  end

  def self.find(uri)
    url = BASE_URL + "r=#{uri}"


    @recipe = HTTParty.get(url)
  
  end

end
