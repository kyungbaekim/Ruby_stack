require 'test_helper'

class EmojisControllerTest < ActionController::TestCase
  test "should get get_api" do
    get :get_api
    assert_response :success
  end

end
