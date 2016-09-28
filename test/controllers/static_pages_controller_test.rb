require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "East Cape"
  end
  
  

  test "should get forum" do
    get :news
    assert_response :success
    assert_select "title", "News | East Cape"
  end
end