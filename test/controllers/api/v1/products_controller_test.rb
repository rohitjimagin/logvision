require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get api_v1_products_destroy_url
    assert_response :success
  end
end
