require 'test_helper'

class MainsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get mains_about_url
    assert_response :success
  end

  test "should get expo" do
    get mains_expo_url
    assert_response :success
  end

  test "should get index" do
    get mains_index_url
    assert_response :success
  end

  test "should get media" do
    get mains_media_url
    assert_response :success
  end

end
