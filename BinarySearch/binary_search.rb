def binary_search(arr,target)
	#array should be sorted for the binary search to work
	arr.sort!
	l = 0
	h = arr.size - 1

	while l <= h 
		
		mid = l + (h - l) / 2

		if arr[mid] == target
			return mid 

		#mid element is exceeds target which means target is in left side
		elsif arr[mid] > target 
			h = mid - 1

		#mid element is less than target which means target is in right side
		else 
			l = mid + 1
		end 

	end

	return -1
end

puts binary_search [2,4,6,8,10], 8