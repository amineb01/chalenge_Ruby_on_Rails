require 'test_helper'

class DemandeeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demandee_index_url
    assert_response :success
  end

end
