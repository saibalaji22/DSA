#upper bound is a SMALLEST INDEX such that the number at that index is 
# arr[upper_bound_index] > target

def upper_bound(arr,target)
	l = 0
	h = arr.size - 1
	upper_bound_index = arr.size #last hypothetical index

	while l <= h 
		mid = l + (h - l) / 2
		if arr[mid] > target
			upper_bound_index = mid 
			h = mid - 1
		else 
			l = mid + 1
		end
	end
	return upper_bound_index
end


puts upper_bound [2,3,6,7,8,8,11,11,11,12],  6
puts upper_bound [2,3,6,7,8,8,11,11,11,12],  12 #last hypothetical index 10