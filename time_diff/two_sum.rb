

def bad_two_sum?(arr, target)
  #time complexit : O(n^2)

  idx1 = 0
  while idx1 < arr.length
    idx2 = idx1 + 1
    while idx2 < arr.length
      return true if arr[idx1] + arr[idx2] == target
      idx2 += 1
    end
    idx1 += 1
  end
  false
end


def okay_two_sum?(arr, target)
  arr.each_with_index do |num, idx|
    sub_array = arr[0...idx] + arr[idx+1..-1]
    target_found = bsearch(sub_array, target - num)
    return true if target_found
  end
  false
end

def bsearch(arr, target)
  return false if arr.empty?
  if arr.length == 1
    if target == arr.first
      return true
    else
      return false
    end
  end
  mid = arr.size / 2

  if arr[mid] == target
    return true
  elsif arr[mid] > target
    bsearch(arr.take(mid), target)
  else
    bsearch(arr.drop(mid + 1), target)
  end
end

# a = [0,1,5,7]
# p okay_two_sum?(a, 6) == true
# p okay_two_sum?(a, 10) == false

def pair_sum?(arr, target)
  freq_table = Hash.new(0)
  arr.each do |num|
    return true if freq_table[target - num] > 0
    freq_table[num] += 1
  end
  false
end


a = [0,1,5,7]
p pair_sum?(a, 6) == true
p pair_sum?(a, 10) == false
