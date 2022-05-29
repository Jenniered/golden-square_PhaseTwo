class PhoneBook
  def initialize
    @numbers = []
  # numbers is an empty array
  end

  def extract(entry)
    entry.contents.scan(/07[0-9]{9}/).each do |number|
      @numbers << number
    end
      @numbers = @numbers.uniq
  # entry is an instance of DiaryEntry
  # extracts the numbers from diary entries
  # looks for a number with 11 digits
  # doesn't save duplicates
  end

  def list_numbers
    return @numbers
  # returns list of phone numbers
  # phone numbers stored as strings
  end 
end