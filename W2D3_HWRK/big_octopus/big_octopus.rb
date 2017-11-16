# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fish_array)
  biggest = ''
  0.upto(fish_array.size - 2) do |i|
    bigger = ''
    1.upto(fish_array.size - 1) do |j|
      big = ''
      fish1 = fish_array[i]
      fish2 = fish_array[j]
      fish1.size > fish2.size ? big = fish1 : big = fish2
      bigger = big if big.size > bigger.size
    end
    biggest = bigger if bigger.size > biggest.size
  end
  biggest
end

# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.

def merge_sort(fish_array)
  return fish_array if fish_array.size <= 1
  mid = fish_array.size / 2
  left = fish_array.take(mid)
  right = fish_array.drop(mid)
  merge(
    merge_sort(left),
    merge_sort(right)
  )
end

def merge(left, right, &prc)
  merged = []
  until left.empty? || right.empty?
    case left.first.size <=> right.first.size
    when 0, 1 then merged << left.shift
    else merged << right.shift
    end
  end
  merged + left + right
end

def dominant_octopus(array)
  merge_sort(array).first
end

# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fish_array)
  biggest = ''
  fish_array.each { |fish| biggest = fish if fish.size > biggest.size }
  biggest
end

# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(step, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if step == tile
  end
end


# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3


def fast_dance(step, tiles_hash)
  tiles_hash[step]
end

tiles_hash = { "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
   "left-up" => 7
 }


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']



p clever_octopus(fish_array) == 'fiiiissshhhhhh'
p dominant_octopus(fish_array) == 'fiiiissshhhhhh'
p sluggish_octopus(fish_array) == 'fiiiissshhhhhh'
p slow_dance("up", tiles_array) == 0
p slow_dance("right-down", tiles_array) == 3
p fast_dance('up', tiles_hash) == 0
p fast_dance('right-down', tiles_hash) == 3
p fast_dance('down', tiles_hash) == 4
p fast_dance('right-up', tiles_hash) == 1
