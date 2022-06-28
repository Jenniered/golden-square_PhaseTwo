class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    @tracks << track
  end

  def all
    @tracks
  end
  
  def search(keyword)
    @tracks.select do |track|
      track.matches?(keyword) == true
    end
  end
end
