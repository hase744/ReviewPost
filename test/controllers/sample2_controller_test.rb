require 'test_helper'

class Sample2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sample2_index_url
    assert_response :success
  end

end
