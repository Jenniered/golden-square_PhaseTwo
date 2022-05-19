require 'make_snippet'

RSpec.describe "make_snippet method" do
  context "if given an empty string" do
    it "returns empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end
    end

  context "if given a string of more than 5 words" do
  it "returns first five words and ..." do
    result = make_snippet("Hello my name is Jennie and I live in London")
    expect(result).to eq "Hello my name is Jennie..."
  end
  end
end
