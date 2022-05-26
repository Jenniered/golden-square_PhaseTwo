require 'diary'

RSpec.describe Diary do
  context "initially" do 
    it "is empty" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end

  context "if no wpm" do
    it "fails" do
      diary = Diary.new
      expect {diary.reading_time(0)}.to raise_error "Reading speed needs to be above zero."

    end
  end
end
