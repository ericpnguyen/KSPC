require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get blog" do
    get blogs_blog_url
    assert_response :success
  end

end
