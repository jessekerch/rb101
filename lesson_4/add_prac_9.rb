def titleize(string)
  words = string.split
  words.map do |word|
    word.capitalize!
  end
  words.join(' ')
end

words = "the flintstones rock"
p titleize(words)