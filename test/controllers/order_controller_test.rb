require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get order_add_url
    assert_response :success
  end

  test "should get show" do
    get order_show_url
    assert_response :success
  end

  test "should get index" do
    get order_index_url
    assert_response :success
  end

end
