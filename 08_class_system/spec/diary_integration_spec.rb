require 'diary'
require 'diary_entry'

# 1 gets all diary entries
RSpec.describe "diary entry integration" do
  context "when diary entries are added" do
    it "gives a list of all diary entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title one", "diary entry one two three")
      diary_entry2 = DiaryEntry.new("title two", "diary entry two three four")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.all).to eq [diary_entry1, diary_entry2]
    end
  end

# 2 returns word count for all
  it "returns the number of words in all diary entries" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title one", "diary entry one two three")
    diary_entry2 = DiaryEntry.new("title two", "diary entry two three four")
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    expect(diary.count_words).to eq 10
  end

# 3 counts time needed to read all diary entries
it "returns the number of minutes needed to read all diary entries" do
  diary = Diary.new
  diary_entry1 = DiaryEntry.new("title one", "diary entry one two three")
  diary_entry2 = DiaryEntry.new("title two", "diary entry two three four")
  diary.add(diary_entry1)
  diary.add(diary_entry2)
  diary.count_words
  expect(diary.reading_time(5)).to eq 2
end

context "if no wpm given" do
  it "fails" do
    diary = Diary.new
    expect { diary.reading_time(0) }.to raise_error "Reading speed needs to be above zero."
  end
end 

# finds best entry for reading time
context "when a user has a given number of minutes to read" do
  it "returns a diary entry that is closest to the length, but not over, the user can read" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title one", "diary entry one two")
    diary.add(diary_entry1)
    expect(diary.find_best_entry_for_reading_time(2, 4)).to eq diary_entry1 
  end
end

context "when there is no suitable diary entry to read" do
  it "returns nil" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title one", "diary entry one two")
    diary.add(diary_entry1)
    expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil 
  end
end

  context "when a user has a given number of minutes to read" do
    it "returns a diary entry that is closest to the length, but not over, the user can read" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title one", "diary entry one two")
      diary_entry2 = DiaryEntry.new("title two", "diary entry two three four")
      diary_entry3 = DiaryEntry.new("title one", "diary entry one two buckle my shoe three four")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.find_best_entry_for_reading_time(2, 5)).to eq diary_entry3 
    end
  end
end