class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @furthest_point_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    arr = @contents.split(" ")
    return arr.length.to_i
  end

  def reading_time(wpm)
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    words_can_read = minutes * wpm
    start_point = @furthest_point_read
    end_point = @furthest_point_read + words_can_read
    arr = @contents.split(" ")
    @furthest_point_read = end_point
    return arr[start_point,end_point].join(" ")
    
  end

end
