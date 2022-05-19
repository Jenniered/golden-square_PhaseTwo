def improve_grammar(text)
  fail "no text given" if text.empty? 
  if text[0] == text[0].upcase && text.end_with?(".", "?", "!")
    return true
  else 
    return false
  end
end