
require_relative '../../lib/anagram_finder'

module AnagramFinder
  class Importer
    attr_reader :dictionary_file

    def initialize(file: default_file)
      @dictionary_file = file
    end

    def import_dictionary
      IO.foreach(dictionary_file) do |word|
        AnagramFinder.add_word_to_dictionary(word)
      end
    end

    private

    def default_file
      File.expand_path(File.join('..', '..', '..', 'wordlist.txt'), __FILE__)
    end
  end
end
