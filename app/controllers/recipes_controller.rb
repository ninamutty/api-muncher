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
  end

  private
  # def search_for_term
  #   params.require(:recipe).permit(:search_term)
  # end
end
