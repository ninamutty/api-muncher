require 'test_helper'
require 'edamam-wrapper'
require 'Recipe'

class EdamamWrapperTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "can retrieve an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamWrapper.find_recipes("chicken", "2", "12")

      assert recipes.is_a? Array
      assert recipes.length > 0  ## Or assert not empty

      recipes.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

  test "retrieves nil when the app_id is broken" do
    VCR.use_cassette("bad_app_id") do
      recipes = EdamamWrapper.find_recipes("chicken", "2", "12", nil,'bad_app_id')
      assert response.parsed_response.include? ("Error 401")
    end
  end

  test "retrieves nil when the app_key is broken" do
    VCR.use_cassette("bad_app_key") do
      recipes = EdamamWrapper.find_recipes("chicken", "2", "12", nil, nil,'bad_app_key')
      assert response.parsed_response.include? ("Error 401")
    end
  end


end
