require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user       = users(:k)
    @other_user = users(:admin)
  end
  
  test "should edit when logged in as admin" do
    session[:user_id] == @other_user.id 
    get :update, id: @user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
  
  test "should destroy when logged in as admin" do
    session[:user_id] == nil
    get :destroy, id: @user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
  
  test "should redirect edit when logged in as wrong user" do
    session[:user_id] == @user.id 
    get :edit, id: @other_user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
  
  test "should redirect destroy when logged in as wrong user" do
    session[:user_id] == @user.id
    get :destroy, id: @other_user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
  
  test "should redirect edit when not logged in" do
    session[:user_id] == nil
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
  
  test "should redirect delete when not logged in" do
    session[:user_id] == nil
    get :destroy, id: @user
    assert_not flash.empty?
    assert_redirected_to forum_path
  end
end
