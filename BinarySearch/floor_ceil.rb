# floor - nums[i] <= target where nums[i] is the largest 
# ceil - nums[i] >= target nums[i] is smallest 

def floor_ceil(nums,target)
	return [find_floor(nums,target),find_ceil(nums,target)]
end


# floor_value  nums[index] <= target where nums[index] is the larget
def find_floor(nums,target)
	floor_value = -1 
	l = 0
	h = nums.size - 1

	while l <= h
		mid = l + (h - l) / 2
		if nums[mid] <= target
			floor_value = nums[mid] #it may be the answer 
			l = mid + 1 #we need to find largest value so move right 
		else 
			h = mid - 1
		end
	end

	return floor_value
end

#ceil_value nums[index] >= target where nums[index] is the smallest
def find_ceil(nums,target)
	ceil_value = -1 
	l = 0
	h = nums.size - 1
	while l <= h 
		mid = l + (h - l) / 2 
		if nums[mid] >= target
			ceil_value = nums[mid] 
			h = mid - 1 #we need to find smallest value so move left 
		else 
			l = mid + 1
		end
	end
	return ceil_value
end

puts floor_ceil [10,20,30,40,50], 25