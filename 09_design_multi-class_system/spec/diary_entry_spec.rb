require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
    expect(diary_entry.title).to eq "my title"
    expect(diary_entry.contents).to eq "some contents have a nice day"
  end

  context "counts the words of a diary entry" do
    it "returns count as an integer" do
      diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
      expect(diary_entry.word_count).to eq 6
    end 
  end

  context "given wpm" do
    it "returns the reading time of a diary entry" do
    diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
    diary_entry.word_count
    expect(diary_entry.reading_time(3)).to eq 2
    end
  end

  context "if no wpm" do
    it "returns an error messsage" do
    diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
    diary_entry.word_count
    expect {diary_entry.reading_time(0) }.to raise_error "Reading speed needs to be above zero."
    end
  end
end