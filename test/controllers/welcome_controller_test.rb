require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
    require "test_helper"

    class WelcomeControllerTest < ActionDispatch::IntegrationTest
      test "should get index home page" do
        get welcomes_url
        assert_response :success
      end
    end
    
end
