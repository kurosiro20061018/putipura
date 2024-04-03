require "test_helper"

class User::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_evaluations_new_url
    assert_response :success
  end

  test "should get show" do
    get user_evaluations_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_evaluations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get user_evaluations_destroy_url
    assert_response :success
  end
end
