# @param {Integer[]} nums
# @return {Integer}

#approach 
# the sorted half may or may not contain the answer 
# find which half is sorted
# pick the min from it and eliminate it 

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
    l = 0
    h = nums.size - 1
    min = Float::INFINITY
    while l <= h 
    	mid = l + (h - l) / 2

    	if nums[l] <= nums[mid]
    		#left half is sorted 
    		# get the min element from it and eliminate it 
    		min = [min,nums[l]].min  # why nums[l] since the half is sorted the  first element in the half will be smallest
    		l = mid + 1
    	else 
    		#right half is sorted 
    		# get the min element from it and eliminate it 
    		min = [min,nums[mid]].min  #why nums[mid] since the half is sorted the first element in the half will be smallest
    		h = mid - 1
    	end
    end
    return min 
end