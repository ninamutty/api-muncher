
class Recipe
  attr_reader :label, :link, :ingredients, :image, :servings, :health_labels, :bookmarked
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]
  BASE_URL = "https://api.edamam.com/"


  def initialize(label, link, ingredients, image, servings, health_labels, bookmarked)
    @label = label
    @link = link
    @ingredients = ingredients
    @image = image
    @servings = servings
    @health_labels = health_labels
    @bookmarked = bookmarked
  end

  def find_recipe
    url = BASE_URL + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{uri}"

    data = HTTParty.get(url)
  end

end
