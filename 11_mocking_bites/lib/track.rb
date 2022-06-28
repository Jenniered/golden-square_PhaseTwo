class Track
  attr_reader :title, :artist
  
  def initialize(title, artist) 
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    if @title.include?(keyword) || @artist.include?(keyword)
      return true
    else
      return false  
    end
    # keyword is a string
    # Returns true if the keyword matches either the title or artist
  end
end
