require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:category)
end
