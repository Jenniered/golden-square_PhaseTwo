require 'DiaryEntry2'

RSpec.describe DiaryEntry do
  it "returns title as a string" do
    diary_entry = DiaryEntry.new("a title", "some contents one two three")
    expect(diary_entry.title).to eq "a title"
  end

  it "returns contents as a string" do
    diary_entry = DiaryEntry.new("a title", "some contents one two three")
    expect(diary_entry.contents).to eq "some contents one two three"
  end

  it "returns the number of words in the contents as an integer" do
    diary_entry = DiaryEntry.new("a title", "some contents one two three")
    expect(diary_entry.count_words).to eq 5
  end

  it "returns an integer representing the reading time in mins for the contents" do
    diary_entry = DiaryEntry.new("a title", "some contents one two three")
    expect(diary_entry.reading_time(5)).to eq 1
  end

  context "if the reading_time is less than or equal to the time the user has" do
    it "returns contents" do 
      diary_entry = DiaryEntry.new("a title", "some contents one two three")
      expect(diary_entry.reading_chunk(200,1)).to eq "some contents one two three"
    end
  end

  context "if the reading_time is more than the time the user has" do
    it "returns contents to read in time available" do 
    diary_entry = DiaryEntry.new("a title", "some contents one two three have a nice day all")
    expect(diary_entry.reading_chunk(5,1)).to eq "some contents one two three"
    end
  end

  context "when the reading_time is more than the time the user has" do
    it "returns next part of the contents for user to read" do 
      diary_entry = DiaryEntry.new("a title", "some contents one two three have a nice day all")  
      diary_entry.reading_chunk(5,1)
      expect(diary_entry.reading_chunk(5,1)).to eq "have a nice day all"
    end
  end

  context "when the reading_time is more than the time the user has" do
    it "returns last part of the contents for user to read" do 
      diary_entry = DiaryEntry.new("a title", "some contents one two three have a nice day all sunny afternoon bit of rain or")  
      diary_entry.reading_chunk(4,2)
      diary_entry.reading_chunk(4,1)
      expect(diary_entry.reading_chunk(4,1)).to eq "bit of rain or"
    end
  end
end

  # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning

