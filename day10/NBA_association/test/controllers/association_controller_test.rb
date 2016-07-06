require 'test_helper'

class AssociationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
