require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    # user will go to page that has form to build tool
    visit new_tool_path

    # user will complete form
    fill_in("Name", with: "Screwdriver")
    fill_in("Price", with: "10.99")
    fill_in("Quantity", with: "10")
    select("Vintage", :from => "Category")
    # user will submit data
    click_button("Create Tool")

    # user will be taken to another page for successful creation
    assert_equal tool_path(Tool.last.id), current_path

    # user's submitted inputs for new tool will be visible on redirected page
    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
      assert page.has_content?("Vintage")
    end
  end

end
