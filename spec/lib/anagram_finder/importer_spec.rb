require 'spec_helper'
require 'anagram_finder/importer'

RSpec.describe AnagramFinder::Importer do
  describe '.import_dictionary' do
    let(:file) { File.join(fixture_path, 'wordlist.txt') }

    it 'import each word in the dictionary file' do
      expect(AnagramFinder).to receive(:add_word_to_dictionary).exactly(11).times
      described_class.new(file: file).import_dictionary
    end
  end
end

