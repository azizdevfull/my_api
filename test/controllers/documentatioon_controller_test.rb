require "test_helper"

class DocumentatioonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get documentatioon_index_url
    assert_response :success
  end
end
