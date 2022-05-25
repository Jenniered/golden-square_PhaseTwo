require 'music_tracker'

RSpec.describe MusicTracker do
  it "fails if there are no tracks on the list" do
    music_tracker = MusicTracker.new
    expect { music_tracker.see_list }.to raise_error "There are no tracks on the list"
  end

  context "when one track added" do
    it "returns a list with one track" do
      music_tracker = MusicTracker.new
      music_tracker.add("Bohemian Rhapsody")
      expect(music_tracker.see_list).to eq "Bohemian Rhapsody"
    end
  end

  context "when multiple tracks added" do
    it "returns a list of the tracks" do
      music_tracker = MusicTracker.new
      music_tracker.add("Bohemian Rhapsody")
      music_tracker.add("Radio Gaga")
      music_tracker.add("We are the champions")
      expect(music_tracker.see_list).to eq "Bohemian Rhapsody, Radio Gaga, We are the champions"
    end
  end
end
