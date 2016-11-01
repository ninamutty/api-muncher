class RecipesController < ApplicationController
  def index
    @data = EdamamWrapper.find_recipes.limit(10)
  end

  def show
  end
end
