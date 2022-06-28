require 'music_library'
require 'track'

RSpec.describe "integrration of music library and track" do
  it "returns a list of tracks" do
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end

  it "returns a list of track that match a keyword" do
    library = MusicLibrary.new
    track_1 = Track.new("Your Song", "Elton John")
    track_2 = Track.new("Sacrifice", "Elton John")
    track_3 = Track.new("Hey Jude", "The Beatles")
    library.add(track_1)
    library.add(track_2)
    library.add(track_3)
    expect(library.search("Elton")).to eq [track_1, track_2]
  end
end

