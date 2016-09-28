require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 
 def setup
    @user       = users(:k)
    @other_user = users(:admin)
  end
 
 
 
 
  test "should redirect edit when logged in as wrong user" do
    session[:user_id] == @user.id 
    get :edit, id: @other_user
    assert flash.empty?
    assert_redirected_to @forum
  end
  
end
