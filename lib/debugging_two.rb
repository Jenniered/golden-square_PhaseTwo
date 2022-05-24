class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0) # Changed [1] --> [0] to get i
    # binding.irb
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      # binding.irb # char --> Returns each letter of text 
      next unless is_letter?(char)
      # binding.irb # is_letter?(char) --> Removes the space
        counter[char] = (counter[char] || 1) + 1
        #counter[char] = (counter[char]) + 1
      # binding.irb # --> counter returns hash with key, value pairs. All equal 1 except i = 2
      if counter[char] > most_common_count
        most_common = char
        most_common_count = counter[char] # Changed += to =
        
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]