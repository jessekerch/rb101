# Jesse Kercheval
# May 31, 2022
# RB101 Small Problems exercises

a = %w(a b c d e)
# puts a.fetch(7)   # This one didn't work, as expected, there is no 7 index
p a.fetch(2, 'beats me')
puts a.fetch(7) { |index| index**2 }