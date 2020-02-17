require 'test_helper'

class ParserSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parser_sites_index_url
    assert_response :success
  end

end
