#Lower bound is defined as the SMALLEST INDEX such that the number at that index is 
#greater than or equal to given target
# i.e arr[lowerBoundIndex] >= target 


def lower_bound(arr,target)
	arr.sort!
	l = 0
	h = arr.size - 1
	#if no lower bound is found then lower bound will be last hypothetical index
	lower_bound_index = arr.size

	# l <= h because we need exact value not a range of values
	while l <= h 
		mid = l + (h - l) / 2

		if arr[mid] >= target 
			#this may be answer but we need to find smallest index so move left
			lower_bound_index = mid 
			h = mid - 1
		else 
			l = mid + 1
		end

	end

	return lower_bound_index
end

puts lower_bound [3,5,8,15,19], 5
puts lower_bound [3,5,8,15,19], 8
puts lower_bound [3,5,8,15,19], 20