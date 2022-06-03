def count_occurrences(vehicles)
  h = vehicles.to_h {|auto| [auto, 0] }
  p h
  

  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

