require 'spec_helper'

describe AnagramFinderApi  do
  let(:dictionary_file) { File.join(fixture_path, 'wordlist.txt') }

  before { AnagramFinder::Importer.new(file: dictionary_file).import_dictionary }

  context "/crepitus" do
    let(:response) do
      {
        "crepitus" => ["cuprites","pictures","piecrust"]
      }.to_json
    end

    before(:each) do
        get "/crepitus"
    end

    it 'returns a JSON Content-Type header' do
      expect(last_response.content_type).to eq('application/json')
    end

    it 'returns a 200 response code' do
      expect(last_response.status).to eq(200)
    end
    it "returns json payload" do
      expect(last_response.body).to eq(response)
    end
  end

  context "/crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort" do
    before(:each) do
      get "/crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort"
    end

    let(:response) do
      {
        "crepitus" => ["cuprites", "pictures", "piecrust"],
        "paste" => ["pates", "peats","septa","spate","tapes","tepas"],
        "kinship" => [],
        "enlist" => [],
        "boaster" => [],
        "fresher" => [],
        "sinks" => [],
        "knits" => [],
        "sort" => []
      }.to_json
    end

    it 'returns a JSON Content-Type header' do
      expect(last_response.content_type).to eq('application/json')
    end

    it 'returns a 200 response code' do
      expect(last_response.status).to eq(200)
    end
    it "returns json payload" do
      expect(last_response.body).to eq(response)
    end
  end

  context "/sdfwehrtgegfg" do
    before(:each) do
      get "/sdfwehrtgegfg"
    end

    let(:response) do
      {
        "sdfwehrtgegfg" => []
      }.to_json
    end

    it 'returns a JSON Content-Type header' do
      expect(last_response.content_type).to eq('application/json')
    end

    it 'returns a 200 response code' do
      expect(last_response.status).to eq(200)
    end
    it "returns json payload" do
      expect(last_response.body).to eq(response)
    end
  end


  context "/" do
    before(:each) do
      get "/"
    end

    it 'returns a 204 response code' do
      expect(last_response.status).to eq(204)
    end
  end


  def app
    AnagramFinderApi.new
  end
end
