require 'test_helper'

class InicialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inicial_index_url
    assert_response :success
  end

end
