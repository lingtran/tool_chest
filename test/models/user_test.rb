require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password
  should have_many(:tools)
end
