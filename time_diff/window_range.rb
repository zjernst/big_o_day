def windowed_max_range(arr, window)
  current_max_range = nil
  index = 0
  while index+window <= arr.length
    arr_slice = arr[index, window]
    range = arr_slice.max - arr_slice.min
    if current_max_range.nil? || range > current_max_range
      current_max_range = range
    end
    index += 1
  end
  current_max_range
end

def windowed_stack(arr, window)
  queue = arr[0, window]
  max = queue.max
  min = queue.min

  index = window
  while index < arr.length
    queue
  end
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
