require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get archive" do
    get archives_archive_url
    assert_response :success
  end

end
