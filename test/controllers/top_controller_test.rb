require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get TopPage" do
    get top_TopPage_url
    assert_response :success
  end

end
