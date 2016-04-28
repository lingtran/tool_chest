require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest

  test "a user can be created" do
    visit new_user_path
    fill_in("Name", with: "Happy Feet")
    fill_in("Email", with: "penguin@fake.com")
    fill_in("Username", with: "penguin")
    fill_in("Password", with: "password")
    click_on "Create Account"

    assert_equal root_path, current_path
    assert page.has_content?("Welcome, Happy Feet!")
  end
end
