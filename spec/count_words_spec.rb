require 'count_words'

RSpec.describe "count_words" do
  it "returns 0 when an empty string is passed" do
    expect(count_words("")).to eq 0
  end
  it "returns 5 when five word string passed" do
    expect(count_words("Hi there, how are you?")).to eq 5
  end
end