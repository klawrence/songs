require "test_helper"

class WordcloudsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wordclouds_show_url
    assert_response :success
  end
end
