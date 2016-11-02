require 'test_helper'
require 'Recipe'

class RecipeTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Must Provide uri, label, link, ingredients, image, health_labels, servings, bookmarked" do
    assert_raises ArgumentError do
      Recipe.new()
    end
    assert_raises ArgumentError do
      Recipe.new("", "", "", "", "", "", "", "")
    end
    assert_raises ArgumentError do
      Recipe.new("stuff", "ndks", "nf", "", "njv", "", "njksa", "")
    end
    assert_raises ArgumentError do
      Recipe.new(nil, nil, nil, "njds", nil, "cds", nil, "ncjs")
    end
    assert_raises ArgumentError do
      Recipe.new(nil, "nj", "njvks", "njvks", "njvks", "njvks", "njvks", "njvks")
    end
  end

end
