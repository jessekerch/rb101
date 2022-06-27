DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, 
           '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(str)

  digit_array = str.chars.map { |digit| DIGITS[digit] }
  
  sum = 0
  digit_array.each { |digit| sum = 10 * sum + digit }
  p sum
  
end  

# ALG
# convert the string to an array of characters
# for each character
#   tell which digit string corresponds to which digit integer
#   convert string to integer
#   join the array elements together to create an integer

# Find the word 'like'

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570