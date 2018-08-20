require 'test_helper'

class ThreadsControllerTest < ActionDispatch::IntegrationTest
	test "should get index" do
		get threads_index_url
		assert_response :success
	end

end
