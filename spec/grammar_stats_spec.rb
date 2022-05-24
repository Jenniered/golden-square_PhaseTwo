require 'grammar_stats'

RSpec.describe GrammarStats do
  it "returns error message when no text given" do
    grammar_stats = GrammarStats.new
    expect { grammar_stats.check("") }.to raise_error "no text given"
  end

  context "if the text starts with a capital and ends with sentence-ending punctuation" do
    it "returns true" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check"Hello how are you?"). to eq true
    end
  end

  context "if the text doesn't start with a capital and ends with sentence-ending punctuation" do
    it "returns false" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check"hello how are you?"). to eq false
    end
  end

  context "when it has checked two texts and one returns true, one returns false" do
    it "has passed 50% of texts and returns 50" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello how are you?")
      grammar_stats.check("hello how are you?")
      expect(grammar_stats.percentage_good).to eq 50
    end
  end
end
