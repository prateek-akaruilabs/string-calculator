require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index home page" do
    get welcomes_url
    assert_response :success
  end

  test "should get the neagtive numbers not allowed as calculation result" do
    post calculate_url, params: { input: "1\n2,3, -455, -33, 2322" }
    assert_response :redirect
    follow_redirect!
    assert_includes flash[:info], "negative numbers not allowed"
  end

  test "should get the correct sum as calculation result" do
    post calculate_url, params: { input:  "1\n2,3, 455, 33, 2322" }
    assert_response :redirect
    follow_redirect!
    assert_includes flash[:info], "The sum of the input string is"
  end
end
