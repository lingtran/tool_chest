require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "a user can login and see own tools" do
    user = User.create(name: "Happy Feet", email: "penguin@fake.com", username: "penguin", password: "password")

    tool = user.tools.create(name: "Sanders", price: "12.00", quantity: 1, category_id: 2)

    visit login_path

    fill_in("Username", with: user.username)
    fill_in("Password", with: user.password)
    click_button "Log In"

    assert_equal user_path(user.id), current_path
    assert page.has_content?("Welcome back!")
    within("#user_tools") do
      assert page.has_content?("#{tool.name}")
      assert page.has_content?("#{tool.price}")
      assert page.has_content?("#{tool.category.name}")
      assert page.has_link?("#{tool.name} Deets")
    end
  end
end
