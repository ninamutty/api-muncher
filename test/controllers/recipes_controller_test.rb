require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get search" do
    VCR.use_cassette("search-for-recipes") do
      get :search, {search_term: 'chicken', page: 1}
      assert_response :success
      assert_template :search
    end
  end

  test "should get show" do
    VCR.use_cassette("show-recipe") do
      get :show, {uri: "http://www.edamam.com/ontologies/edamam", format: "owl#recipe_c468dc28f8b64bb711125cc150b15c25"}
      assert_response :success
      assert_template :show
    end
  end


end
