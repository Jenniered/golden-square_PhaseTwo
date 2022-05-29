require 'diary'

RSpec.describe Diary do
  it "initializes with an empty list" do
    diary = Diary.new
    expect(diary.all).to eq []
  end
end

