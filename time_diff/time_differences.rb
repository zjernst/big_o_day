require 'byebug'

def my_min(list)
  #currect_min = list.first
  min = false
  list.each_with_index do |el1, idx1|
    min = true
    list.each_with_index do |el2, idx2|
      next if idx1 == idx2
      if el1 > el2
        min = false
      end
    end
    return el1 if min
  end
end

def my_min2(list)
  min = list.first
  list.drop(1).each do |el|
    min = el if el < min
  end
  min
end

def contiguous_sums(list)
  biggest_sum = nil
  index = 0
  while index < list.length
    len = 0
    while len + index <= list.length
      sum = list[index..index+len].reduce(:+)
      biggest_sum = sum if biggest_sum.nil? || sum > biggest_sum
      len += 1
    end
    index += 1
  end
  biggest_sum
end

def contig_sums(array)
  best_sum = array.first
  running_sum = 0

  array.each_with_index do |num, idx|
    running_sum += num
    if running_sum > best_sum
      best_sum, left_index = running_sum, idx
    end
    running_sum = 0 if running_sum < 0
  end

  best_sum
end
