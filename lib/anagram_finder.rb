require 'redis'
require_relative 'string'
require 'dotenv'

module AnagramFinder
  def self.add_word_to_dictionary(word)
    redis.sadd(word.anagram_index, word.strip)
  end

  def self.dictionary_matches_for_word(word)
    redis.smembers(word.anagram_index).reject do |w|
      w == word.strip
    end
  end

  private

  def self.redis
    @_redis = Redis.new(url: ENV['REDIS_URL'] || ENV['REDISCLOUD_URL'])
  end

end
