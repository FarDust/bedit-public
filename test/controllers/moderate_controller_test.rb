require 'test_helper'

class ModerateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moderate_index_url
    assert_response :success
  end

end
