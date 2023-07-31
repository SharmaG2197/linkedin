require "test_helper"

class GroupchatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groupchats_index_url
    assert_response :success
  end
end
