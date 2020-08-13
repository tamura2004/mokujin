require 'test_helper'

class Api::V1::AllocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_allocs_index_url
    assert_response :success
  end

end
