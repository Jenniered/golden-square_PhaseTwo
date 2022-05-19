def make_snippet(string)
  arr = string.split(" ")
    if arr.length < 5
      return arr.join(" ")
    else
      snippet = arr[0..4].join(" ")
      return snippet + "..."
    end
end

