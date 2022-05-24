def check_for_todo(text)
  fail "There's no text to check." if text.empty?
  text.include? "#TODO"  
end

#code below was refactored to the above
#if text.include? "#TODO"
 # return true
#else
 # return false
#end