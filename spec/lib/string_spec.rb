require 'spec_helper'
require 'string'

RSpec.describe String do

  subject { "Chimewemwe's " }

  describe '#anagram_index' do
    it 'returns the string characters sorted' do
      expect(subject.anagram_index).to eq("'ceeehimmsww")
    end
  end
end
