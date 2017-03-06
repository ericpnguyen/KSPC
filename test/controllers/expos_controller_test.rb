require 'test_helper'

class ExposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expos_index_url
    assert_response :success
  end

  test "should get new" do
    get expos_new_url
    assert_response :success
  end

  test "should get edit" do
    get expos_edit_url
    assert_response :success
  end

  test "should get _form" do
    get expos__form_url
    assert_response :success
  end

end
