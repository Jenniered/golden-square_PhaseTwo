def reading_estimate(text)
  arr = text.split(" ")
  time_in_mins = (arr.length / 200.to_f).ceil
  return time_in_mins
end