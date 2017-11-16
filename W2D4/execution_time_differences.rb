require 'byebug'
def my_min(list)
  least = nil
  list.each do |el|
    least ||= el
    least = el if el < least
    list[1..-1].each do |el2|
      least = el2 if el2 < least
    end
  end
  least
end
  
def my_min2(list)
  least = nil
  list.each do |el|
    least ||= el
    least = el if el < least
  end
  least
end

def largest_contiguous_subsum(list)
  largest_sum = list.shift
  current_sum = largest_sum
  list.each do |n|
    if current_sum < 0 && n > current_sum
      current_sum = n
      largest_sum = n
    else 
      current_sum += n
    end
    if current_sum < 0 
      current_sum = 0
    elsif current_sum >= 0 
      if current_sum > largest_sum
        largest_sum = current_sum
      end 
    end 
  end
  largest_sum
end

p largest_contiguous_subsum([2,3,-6,7,-6,7])


# 
list1 = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list2 = [5, 3, -7]
list3 = [2, 3, -6, 7, -6, 7]
list4 = [-5, -1, -3]
list5 = [5, 3, -7, 9]

# p start2([5, 3, -7]) 
# p '#my_min PHASE 1'
# p my_min(list1) == -5
# p my_min(list2) == -7
# p my_min(list3) == -6
# 
# p '#my_min PHASE 2'
# p my_min2(list1) == -5
# p my_min2(list2) == -7
# p my_min2(list3) == -6

p largest_contiguous_subsum(list1)
p largest_contiguous_subsum(list2)
p largest_contiguous_subsum(list3)
p largest_contiguous_subsum(list4)
p largest_contiguous_subsum(list5)
























