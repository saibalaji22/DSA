=begin 
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with O(log n) runtime complexity.

Example 1:

Input: nums = [1,3,5,6], target = 5
Output: 2

Example 2:

Input: nums = [1,3,5,6], target = 2
Output: 1

Example 3:

Input: nums = [1,3,5,6], target = 7
Output: 4
=end


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

#We need to find the lower bound because we need an index such that nums[index] >= target 
def search_insert(nums, target)
    l = 0 
    h = nums.size - 1
    lower_bound_index = nums.size #last hypothetical index 

    while l <= h

    	mid = l + (h - l) / 2
    	if nums[mid] == target
    		return mid 
    	end  

    	if nums[mid] >= target
    		lower_bound_index = mid
    		h = mid - 1
    	else
    		l = mid + 1
    	end


    end
    return lower_bound_index
end


puts search_insert [1,3,5,6], 7








