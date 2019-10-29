require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get transaction_add_url
    assert_response :success
  end

end
