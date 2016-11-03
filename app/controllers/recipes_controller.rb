require "#{Rails.root}/lib/edamam-wrapper.rb"
require "#{Rails.root}/lib/Recipe.rb"

class RecipesController < ApplicationController
  def index
    @all_health = ["alcohol-free", "celery-free", "crustacean-free", "dairy-free", "egg-free", "fish-free", "gluten-free", "kidney-friendly", "kosher", "low-potassium", "lupine-free", "mustard-free", "low-fat-abs", "No-oil-added", "low-sugar", "paleo", "peanut-free", "pecatarian", "pork-free", "red-meat-free", "sesame-free", "shellfish-free", "soy-free", "sugar-conscious", "tree-nut-free", "vegan", "vegetarian", "wheat-free"]
  end

  def search(page=0)
    @search_term = params[:search_term]
    @filters = params["health_labels"]

    page = params[:page]

    first_hit = "#{page}0".to_i
    last_hit = "#{page}9".to_i

    unless @search_term == nil
      @data = EdamamWrapper.find_recipes(@search_term, first_hit, last_hit, @filters)
    else
      @data = nil
    end

  end

  def show
    @params = params[:uri] + "." + params[:format].gsub(/#/,'%23')  ### This may look unnecessary but trust me, it was
    @recipe = Recipe.find(@params)

     #@recipe = Recipe.new(params[:recipe][:id], params[:recipe][:uri], params[:recipe][:label], params[:recipe][:link], params[:recipe][:ingredients], params[:recipe][:image], params[:recipe][:health_labels], params[:recipe][:bookmarked])

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
