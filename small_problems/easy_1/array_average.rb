# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Examples:

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# PEDAC
# Problem:
# - Input: Array object
# - Output: Integer object
# - Rules:
#   - Explicit:
#     - method takes one argument 
#       - Array containing Integers 
#       - Array is non-empty
#       - Integers in Array are all positive numbers
#     - method returns an Integer object
#       - value is equal to average of all numbers in Input Array
#   - Implicit:
#     - Integers are positive values greater than 0
#
# Example:
#  - Test Case 1:
#   - Input: [1, 6] 
#   - Output: 3
#     - 1 + 6 / 2 -> 3.5 -> Integer -> 3 
#
# Data Structures:
#  
# Algorithm and Code:
# create a method named average
# takes one argument, an Array Object
def average(arr)
  # return a Integer Object
  result = nil

  # create a variable to keep track of the sum
  sum = 0

  # iterate through arr 
  # access each element value
  # add the value of each element to sum
  arr.each do |num|
    sum += num
  end

  # divide sum by the number of elements in arr
  num_of_elements = arr.size
  result = sum / num_of_elements

  # return value 
  result
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40