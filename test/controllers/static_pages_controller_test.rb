require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do 
  	get root_url
  	assert_response :success 	
  end
end
