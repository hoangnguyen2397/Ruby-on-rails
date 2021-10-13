require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: "example@example.com", password: "Test123")
    assert user.valid?
  end
end
