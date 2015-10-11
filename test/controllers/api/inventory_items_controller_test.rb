require 'test_helper'

class Api::InventoryItemsControllerTest < ActionController::TestCase
  test "should get verify" do
    get :verify
    assert_response :success
  end

end
