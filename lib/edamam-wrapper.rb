require 'httparty'
# require 'json'
# require 'open-uri'

class EdamamWrapper
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]
  BASE_URL = "https://api.edamam.com/"
  MAX_HITS = 30

  def self.find_recipes(term, from, to, health=nil, app_id=nil, app_key=nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    url = BASE_URL + "search?q=#{term}" + "&app_id=#{app_id}" + "&app_key=#{app_key}" + "&from=#{from}" + "&to=#{to}"

    data = HTTParty.get(url)

    my_recipes = []
    if data["hits"]
      data["hits"].each_with_index do |recipe, index|
        label = data["hits"][index]["recipe"]["label"]
        uri = data["hits"][index]["recipe"]["uri"]
        link = data["hits"][index]["recipe"]["url"]
        ingredients = data["hits"][index]["recipe"]["ingredients"]
        image = data["hits"][index]["recipe"]["image"]
        # servings = data["hits"][index]["recipe"]["yield"]
        health_labels = data["hits"][index]["recipe"]["healthLabels"]
        servings = data["hits"][index]["recipe"]["servings"]
        bookmarked = data["hits"][index]["bookmarked"]

        # raise

        my_recipes << Recipe.new(uri, label, link, ingredients, image, health_labels, servings, bookmarked)
      end
      return my_recipes
    else
      return nil
    end
    #
    # if data.first.class != Recipe
    #   data = Nokogiri::XML(open("data"))
    # end
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
