require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get archives_about_url
    assert_response :success
  end

  test "should get blog" do
    get archives_blog_url
    assert_response :success
  end

  test "should get expo" do
    get archives_expo_url
    assert_response :success
  end

  test "should get media" do
    get archives_media_url
    assert_response :success
  end

  test "should get contact" do
    get archives_contact_url
    assert_response :success
  end

end
