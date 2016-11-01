
class Recipe
  attr_reader :id, :name, :link, :ingredients, :diet_labels, :calories, :image, :servings, :health_labels, :bookmarked

  def initialize(id, name, link, ingredients, diet_labels, calories, image, servings, health_labels, bookmarked)
    @id = id
    @name = name
    @link = link
    @ingredients = ingredients
    @diet_labels = diet_labels
    @calories = calories
    @image = image
    @servings = servings
    @health_labels = health_labels
    @bookmarked = bookmarked
  end

end
