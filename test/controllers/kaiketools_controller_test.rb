require 'test_helper'

class KaiketoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kaiketools_index_url
    assert_response :success
  end

end
