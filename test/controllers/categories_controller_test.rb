require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  # Avoid redundancy in test
  ASSERT_SUCCESS_RESPONSE = lambda do
    assert_response :success
  end

  # TODO: DRY out assert statement

  def setup
    @category = Category.create name: 'sports'
  end

  test "should get categories index" do
    get :index
    ASSERT_SUCCESS_RESPONSE
    # assert_response :success
  end

  test "should get new" do
    get :new
    ASSERT_SUCCESS_RESPONSE
    # assert_response :success
  end

  test "should get show" do
    get :show, id: @category.id
    ASSERT_SUCCESS_RESPONSE
    # assert_response :success
  end

end