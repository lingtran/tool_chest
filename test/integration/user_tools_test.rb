require 'test_helper'

class UserToolsTest < ActionDispatch::IntegrationTest
  test "a logged in user can view their tools" do
    user = User.create(name: "Happy Feet", email: "penguin@fake.com", username: "penguin", password: "password")
    tool_one = user.tools.create(name: "tool one", price: "1.00", quantity: 1, category_id: 1)
    tool_two = user.tools.create(name: "tool two", price: "2.00", quantity: 2, category_id:2)

    visit user_path(user)

    within("#user_tools") do
      assert page.has_content?("#{tool_one.name}")
      assert page.has_content?("#{tool_one.price}")
      assert page.has_content?("#{tool_one.category.name}")
      assert page.has_content?("#{tool_two.name}")
      assert page.has_content?("#{tool_two.price}")
      assert page.has_content?("#{tool_two.category.name}")
    end
  end
end
