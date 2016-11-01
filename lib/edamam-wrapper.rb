require 'httparty'

class EdamamWrapper
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]
  BASE_URL = "https://api.edamam.com/"

  def self.find_recipes
    url = BASE_URL + "search?q=#{term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&from=#{from}" + "&to=#{to}" + ("&health=#{health}" if health != nil)

    response = HTTParty(url)

    my_recipes = []
    response["hits"].each do |recipe|
      id = hit["id"]  # Does it return this?
      label = hit["recipe"]["label"]
      link = hit["recipe"]["url"]
      ingredients = hit["recipe"][ingredients]
      calories = hit["recipe"]["calories"]
      diet_labels = hit["recipe"]["dietLabels"]
      image = hit["recipe"]["image"]
      servings = hit["recipe"]["yield"]
      health_labels = hit["recipe"]["healthLabels"]
      bookmarked = hit["bookmarked"]

      my_recipes << Recipe.new()
    end

  end
end




###################
### INFO NEEDED ###
###################
#
# From Recipe (required):
#  - Name ("label")
#  - Link to the original recipe (opens in a new tab) - ("url")
#  - Ingredients ("ingredients" - returns array with hashes of ("text","quantity", "measure", "food", and "weight"))
#  - Dietary information
#     - "calories"
#     - "dietLabels" - return array of strings
#  - Image ("image")
#
#
#
# Optional (outside recipe):
#  - "bookmarked"(boolean) - NOT in recipe value
#  - "healthLabels" (in recipe value) - - return array of string
#
#
#  - yield ('yield')
