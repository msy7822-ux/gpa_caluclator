require 'test_helper'

class CalculateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calculate_index_url
    assert_response :success
  end

end
