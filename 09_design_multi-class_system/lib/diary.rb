class Diary
  def initialize
    @list = []
  # list as an empty array
  end

  def add(entry) 
    @list << entry
  # entry is an instance of DiaryEntry
  # DiaryEntry gets added to the Diary
  # Returns nothing
  end

  def all
    @list
  # Returns a list of diary entries
  end
  
  def select_entry(wpm, minutes) 
    possible_entries = @list.select do |entry|
      entry.reading_time(wpm) <= minutes
    end
      sorted_entries = possible_entries.sort_by do |entry|
        entry.word_count 
      end
    return sorted_entries.last
  # wpm is number of words can read in a minute
  # minutes is time available to read
  # Returns a diary entry that can read in time available - reading time needs to be less than time available, select best entry for time
  end
end