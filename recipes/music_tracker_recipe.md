{{Music Tracker}} Class Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

# EXAMPLE

class MusicTracker
  def initialize
    @list = []
    #list is an empty array to start with
  end

  def add(track) # track is a string
    # No return value
  end

  def see_list()
    # Gives an error message if nothing on the list
    # Otherwise, returns the list of tracks as a string
  end
end

3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
music_tracker = MusicTracker.new
music_tracker.see_list # => fails with error message "There are no tracks on the list"

# 2
music_tracker = MusicTracker.new
music_tracker.add("Bohemian Rhapsody")
music_tracker.see_list # => "Bohemian Rhapsody"

# 3
music_tracker = MusicTracker.new
music_tracker.add("Bohemian Rhapsody")
music_tracker.add("Radio Gaga")
music_tracker.add("We are the champions")
music_tracker.see_list # => "Bohemian Rhapsody, Radio Gaga, We are the champions"