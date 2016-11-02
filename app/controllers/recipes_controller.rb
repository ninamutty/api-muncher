require "#{Rails.root}/lib/edamam-wrapper.rb"
require "#{Rails.root}/lib/Recipe.rb"

class RecipesController < ApplicationController
  def index
  end

  def search
    @search_term = params[:search_term]

    unless @search_term == nil
      @data = EdamamWrapper.find_recipes(@search_term)
    else
      @data = nil
    end
  end

  def show
    # @recipe = Recipe.new(params[:recipe])
    @recipe = Recipe.new(params[:recipe][:label], params[:recipe][:link], params[:recipe][:ingredients], params[:recipe][:image], params[:recipe][:servings], params[:recipe][:health_labels], params[:recipe][:bookmarked])

#params[:recipe][:uri]

    # @recipe.label = params[:recipe][:label]
    # @recipe.link = params[:recipe][:link]
    # @recipe.ingredients = params[:recipe][:ingredients]
    # @recipe.diet_labels = params[:recipe][:diet_labels]
    # @recipe.image = params[:recipe][:image]
    # @recipe.calories = params[:recipe][:calories]
    # @recipe.uri = params[:recipe][:uri]
    # @recipe.servings = params[:recipe][:servings]
    # @recipe.health_labels = params[:recipe][:health_labels]
    # @recipe.bookmarked = params[:recipe][:bookmarked]
  end

end
