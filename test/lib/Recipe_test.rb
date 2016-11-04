require 'test_helper'
require 'Recipe'

class RecipeTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Must Provide uri, label, link, ingredients, image, health_labels, servings, bookmarked" do
    assert_raises ArgumentError do
      Recipe.new nil, nil, nil, nil, nil, nil, nil, nil
    end
    assert_raises ArgumentError do
      Recipe.new "", "", "", "", "", "", "", ""
    end
    assert_raises ArgumentError do
      Recipe.new "stuff", "ndks", "nf", "", "njv", "", "njksa", ""
    end
    assert_raises ArgumentError do
      Recipe.new nil, nil, nil, "njds", nil, "cds", nil, "ncjs"
    end
    assert_raises ArgumentError do
      Recipe.new nil, "nj", "njvks", "njvks", "njvks", "njvks", "njvks", "njvks"
    end
    assert_raises ArgumentError do
      Recipe.new "nvjs", "nj", "njvks", "", "njvks", "njvks", "njvks", "njvks"
    end
  end

  test "Uri Attribute is set correctly" do
    test_me = Recipe.new("uri", "label", "link", "ingredients", "image", "health_labels", "servings", "bookmarked")
    assert test_me.uri == "uri"
  end

  test "Label Attribute is set correctly" do
    test_me = Recipe.new("uri", "label", "link", "ingredients", "image", "health_labels", "servings", "bookmarked")
    assert test_me.label == "label"
  end

  test "Link Attribute is set correctly" do
    test_me = Recipe.new("uri", "label", "link", "ingredients", "image", "health_labels", "servings", "bookmarked")
    assert test_me.link == "link"
  end

  test "ingredients Attribute is set correctly" do
    test_me = Recipe.new("uri", "label", "link", "ingredients", "image", "health_labels", "servings", "bookmarked")
    assert test_me.ingredients == "ingredients"
  end

  test "image Attribute is set correctly" do
    test_me = Recipe.new("uri", "label", "link", "ingredients", "image", "health_labels", "servings", "bookmarked")
    assert test_me.image == "image"
  end

  test "Can find a properly formatted recipe using a uri" do
    VCR.use_cassette("find-recipe") do
      response = Recipe.find("http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
      assert response.first.is_a? Hash
      assert response.first["label"] != nil
      assert response.first["uri"] != nil
    end
  end

  test "Response fails when recipe uri doesn't exist" do
    VCR.use_cassette("no-recipe") do
      response = Recipe.find("bad_uri")
      assert response.body == '['
    end
  end

end
