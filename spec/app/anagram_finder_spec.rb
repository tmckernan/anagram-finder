require 'spec_helper'
describe AnagramFinder  do
    context "hello world" do
      it "returns hello world" do
        get "/"

        expect(last_response.body).to eq("Hello World!")
        expect(last_response.status).to eq 200
      end
    end

  def app
    AnagramFinder.new
  end
end
