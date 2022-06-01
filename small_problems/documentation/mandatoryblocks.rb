def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
  lengths
end

p string_lengths('To be or not to be')