require 'track'

RSpec.describe Track do
  it "returns the title of the track" do
    track_1 = Track.new("Yesterday", "The Beatles")
  expect(track_1.title).to eq "Yesterday"
  end

  it "returns the artist of the track" do
    track_1 = Track.new("Yesterday", "The Beatles")
  expect(track_1.artist).to eq "The Beatles"
  end

  it "returns true if keyword matches either title or string" do
    track_1 = Track.new("Yesterday", "The Beatles")
    expect(track_1.matches?("Beatles")).to eq true
  end

  it "returns false if keyword doesn't match either title or string" do
    track_1 = Track.new("Yesterday", "The Beatles")
    expect(track_1.matches?("Elton")).to eq false
  end
end
