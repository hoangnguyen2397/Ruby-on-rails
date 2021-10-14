require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    test "can see welcome page" do
      get articles_path
      assert_response :success
    end

    test "render page new article" do
      user = User.new(email: "example@example.com", password: "Test123")
      sign_in user
      get new_article_path
      assert_response :success
    end
end
