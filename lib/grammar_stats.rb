class GrammarStats
  def initialize
    @text = ""
    @counter = []
  end

  def check(text)
    fail "no text given" if text.empty?
    if text[0] == text[0].upcase && text.end_with?(".", "?", "!")
      @counter << "true"
      return true
    else 
      @counter << "false"
      return false
    end
  # text is a string
  # Returns true or false depending on whether the text begins with a capital
  # letter and ends with a sentence-ending punctuation mark.
  end

  def percentage_good
    num_true = @counter.count("true")
    total = @counter.length
    (num_true / total.to_f) * 100
  end
end
    
  # Returns as an integer the percentage of texts checked so far that passed
  # the check defined in the `check` method. The number 55 represents 55%.

