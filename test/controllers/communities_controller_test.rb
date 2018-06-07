require 'test_helper'

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get moderator" do
    get communities_moderator_url
    assert_response :success
  end

end
