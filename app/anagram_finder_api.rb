require 'sinatra'
require 'redis'
require './lib/anagram_finder'
require './lib/string'

class AnagramFinderApi < Sinatra::Base

  get '/*' do
    query = request.path_info.split('/').last.to_s
    halt 204 if query.length < 1
    response = matches(query.split(','))
    content_type :json
    response.to_json
  end

  private

  def matches(words)
    Hash[words.map do |word|
      [word, AnagramFinder.dictionary_matches_for_word(word).sort]
    end]
  end
end
