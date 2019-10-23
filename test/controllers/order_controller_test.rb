require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get order_add_url
    assert_response :success
  end

end
