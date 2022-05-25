class MusicTracker
  def initialize
    @list = []
  end

  def add(track) # track is a string
    @list << track
    # No return value
  end

  def see_list()
    fail "There are no tracks on the list" if @list.empty?
    return @list.join(", ")
    # Gives an error message if nothing on the list
    # Otherwise, returns the list of tracks as a string
  end
end