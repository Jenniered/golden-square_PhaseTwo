require 'music_library'

RSpec.describe MusicLibrary do
  it "intializes with an empty array" do
    library = MusicLibrary.new
    expect(library.all).to eq []
  end

  it "returns a list of tracks" do
    library = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end

  it "returns a list of tracks that match a keyword" do
    library = MusicLibrary.new
    track_1 = double :track
    expect(track_1).to receive(:matches?).with("Elton").and_return(true)
    track_2 = double :track
    expect(track_2).to receive(:matches?).with("Elton").and_return(false)
    library.add(track_1)
    library.add(track_2)
    expect(library.search("Elton")).to eq [track_1]
  end

end
