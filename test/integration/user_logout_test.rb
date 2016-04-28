require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "a user can logout" do
    user = User.create(name: "Happy Feet", email: "penguin@fake.com", username: "penguin", password: "password")

    visit login_path

    fill_in("Username", with: user.username)
    fill_in("Password", with: user.password)
    click_button "Log In"
    click_link "Log Out"

    assert_equal root_path, current_path
    refute page.has_content?("Log Out")
  end
end
