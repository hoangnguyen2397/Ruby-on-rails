require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test 'should not save article without title' do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test 'should create Article valid' do
    user = User.new(email: "example@example.com", password: "Test123")
    article = Article.new(title: "Article 12", body: "This is the Article 12", status: "public", user: user)
    assert article.valid?
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
