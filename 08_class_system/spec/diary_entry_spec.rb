require 'diary_entry'

RSpec.describe DiaryEntry do
  it "gives a title" do
    diary_entry = DiaryEntry.new("its title", "one two three lots of words")
    expect(diary_entry.title).to eq "its title"
  end
  
  it "sets the contents" do
    diary_entry = DiaryEntry.new("its title", "one two three lots of words")
    expect(diary_entry.contents).to eq "one two three lots of words"
  end

  it "gives the word count" do
    diary_entry = DiaryEntry.new("its title", "one two three lots of words")
    expect(diary_entry.count_words).to eq 6
  end
  
  context "if no contents" do
    it "returns zero for word count" do
     diary_entry = DiaryEntry.new("its title", "")
     expect(diary_entry.count_words).to eq 0
    end
   end

  it "calculates the reading time of the text" do
    diary_entry = DiaryEntry.new("its title", "one two three lots of words")
    result = diary_entry.reading_time(200)
    expect(result).to eq 1
  end

  context "if no wpm given" do
    it "fails" do
      diary_entry = DiaryEntry.new("its title", "one two three lots of words")
      expect { diary_entry.reading_time(0) }.to raise_error "Reading speed needs to be above zero."
    end
  end 

end
