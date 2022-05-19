require 'reading_estimate'

RSpec.describe "reading_estimate" do
  context "if given an empty string" do
    it "returns zero" do
    expect(reading_estimate("")).to eq 0
    end
  end
  context "if given a string with under 200 words" do
    it "returns one" do
    result = reading_estimate("hello world")
    expect(result).to eq 1
    end
  end
  context "if given a string with 200 words" do
    it "returns one" do
    result = reading_estimate("one " * 200)
    expect(result).to eq 1
    end
  end
  context "if given a string with 400 words" do
    it "returns two" do
    result = reading_estimate("one " * 400)
    expect(result).to eq 2
    end
  end
  context "if given a string with 550 words" do
    it "returns three" do
    result = reading_estimate("one " * 550)
    expect(result).to eq 3
    end
  end
end
