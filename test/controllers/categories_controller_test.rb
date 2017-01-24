require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  # Avoid redundancy in test
  ASSERT_SUCCESS_RESPONSE = lambda do
    assert_response :success
  end

  # TODO: DRY out assert statement

  def setup
    @category = Category.create name: 'sports'
    @user = User.create username: 'test', email: 'test@test.com', password: 'test', admin: true
    # byebug
  end

  test "should get categories index" do
    get :index
    # ASSERT_SUCCESS_RESPONSE
    assert_response :success
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    # ASSERT_SUCCESS_RESPONSE
    assert_response :success
  end

  test "should get show" do
    get :show, id: @category.id
    # ASSERT_SUCCESS_RESPONSE
    assert_response :success
  end

  test "should redirect when 'create' when not admin" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: 'tech'}
    end
    assert_redirected_to categories_path
  end

end