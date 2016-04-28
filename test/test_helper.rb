ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'pry-rails'

class ActiveSupport::TestCase


end

ActiveRecord::Migration.maintain_test_schema!

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
