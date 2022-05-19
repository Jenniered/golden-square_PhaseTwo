def check_for_todo(text)
  fail "There's no text to check." if text.empty?
  if text.include? "#TODO"
    return true
  else
  end
end