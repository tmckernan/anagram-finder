require 'bundler'
require 'rubygems'

Bundler.require(:default, :test)
require 'rack/test'
require 'pry'

ENV['RACK_ENV'] = 'test'
require_relative '../config/environment'

require File.join(File.dirname(__FILE__), '..', 'app', 'anagram_finder_api.rb')

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.include Rack::Test::Methods
end

def fixture_path
  File.expand_path(File.join('..', 'support', 'fixtures'), __FILE__)
end

