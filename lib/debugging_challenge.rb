def get_most_common_letter(text)
  counter = Hash.new(0)
  text.gsub( /\W/, "").chars.each do |char|
  counter[char] += 1
  end
  ordered_arr = counter.to_a.sort_by { |k, v| -v }
  return ordered_arr[0][0]
end

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"

puts get_most_common_letter("the roof, the roof, the roof is on fire!")
