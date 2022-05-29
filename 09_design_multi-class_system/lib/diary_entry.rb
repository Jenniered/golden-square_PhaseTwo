class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  # title and contents are both strings
  end

  def title
    @title
  # returns title
  end

  def contents
    @contents
  # returns contents
  end

  def word_count
    arr = @contents.split(" ")
    return arr.length.to_i
  # Returns word count for diary entry
  end

  def reading_time(wpm)
    fail "Reading speed needs to be above zero." unless wpm > 0 
    return (word_count / wpm.to_f).ceil
  # calculates reading time of diary entry based on wpm
  end
end