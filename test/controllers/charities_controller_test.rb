require 'test_helper'

class CharitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get fourloveofbaja" do
    get charities_fourloveofbaja_url
    assert_response :success
  end

end
