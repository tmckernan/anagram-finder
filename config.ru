require 'rubygems'
require 'bundler'
require_relative 'config/environment'
Bundler.require(:default)
use Rack::CommonLogger, STDOUT

require_relative 'app/anagram_finder_api'
require_relative 'lib/anagram_finder'


run AnagramFinderApi
