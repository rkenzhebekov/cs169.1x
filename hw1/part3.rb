def combine_anagrams(words)
  h = {}
  words.each do |word|
    key = word.upcase.chars.sort.join
    if h.has_key? key
      h[key] << word
    else
      h[key] = [word]
    end
  end
  h.values
end

#p combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
