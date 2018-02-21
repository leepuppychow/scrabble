require 'rails_helper'

describe ValidateWordService do
  it "can validate that a word is real" do
    VCR.use_cassette("foxes") do
      v = ValidateWordService.new("foxes")

      expect(v.status_code).to eq 200
      expect(v.root).to eq "fox"
    end
  end

  it "can find that a word is invalid" do
    VCR.use_cassette("notarealword") do
      v = ValidateWordService.new("notarealword")

      expect(v.status_code).to eq 404
    end
  end


end
