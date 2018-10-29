
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database'
require_relative './setup_test_database'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'ChitterApp')

Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

  ENV['ENVIRONMENT'] = 'test'

  RSpec.configure do |config|
    config.before(:each) do
      setup_test_database
    end
  end
