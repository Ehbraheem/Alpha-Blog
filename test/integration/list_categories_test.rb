require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    %w(Sports Programming).each do |category|
      Category.create name: category
    end
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(Category.first), text: Category.first.name
    assert_select "a[href=?]", category_path(Category.last), text: Category.last.name
  end
end