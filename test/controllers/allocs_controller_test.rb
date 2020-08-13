require 'test_helper'

class AllocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get allocs_index_url
    assert_response :success
  end

end
