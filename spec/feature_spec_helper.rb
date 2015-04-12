ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require 'capybara/rspec'
require File.expand_path('../../config/environment', __FILE__)
require 'capybara/rails'

Capybara.default_driver = :selenium

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end