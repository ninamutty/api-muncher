require "#{Rails.root}/lib/edamam-wrapper.rb"
require "#{Rails.root}/lib/Recipe.rb"

class RecipesController < ApplicationController
  def index
    @background_image = true
    @all_health = ["vegan", "vegetarian", "paleo", "dairy-free", "gluten-free", "wheat-free", "fat-free", "low-sugar", "egg-free", "peanut-free", "tree-nut-free", "soy-free", "fish-free", "shellfish-free"]
  end

  def search(page=0)
    @background_image = false
    @search_term = params[:search_term]
    @filters = params["healthLabels"]

    page = params[:page]

    first_hit = "#{page}0".to_i
    last_hit = "#{page.to_i + 1}0".to_i

    unless @search_term == nil
      if @filters == nil
        @data = EdamamWrapper.find_recipes(@search_term, first_hit, last_hit)
      else
        @data = EdamamWrapper.find_recipes(@search_term, first_hit, last_hit, @filters)
      end
    else
      @data = nil
    end

  end

  def show
    @background_image = false
    @params = params[:uri] + "." + params[:format].gsub(/#/,'%23')  ### This may look unnecessary but trust me, it was
    @recipe = Recipe.find(@params)
  end

end
