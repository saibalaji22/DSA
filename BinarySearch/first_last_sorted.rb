=begin
	
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:

Input: nums = [], target = 0
Output: [-1,-1]

=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    first_occurence_index = first_occurence nums, target
    last_occurence_index = last_occurence nums, target 
    return [first_occurence_index, last_occurence_index]
end

def first_occurence(nums,target)
	l = 0
	h = nums.size - 1
	first = -1
	while l <= h 
		mid = l + (h - l) / 2
		if nums[mid] == target
			# we need to find first occurence so move left
			first = mid  
			h = mid - 1
		elsif nums[mid] > target
			h = mid - 1
		else 
			l = mid + 1
		end 
	end
	return first
	
end

def last_occurence(nums,target)
	l = 0
	h = nums.size - 1
	last = -1
	while l <= h 
		mid = l + (h - l) / 2
		if nums[mid] == target 
			# we need to find last occurence so move right
			last = mid 
			l = mid + 1
		elsif nums[mid] > target
			h = mid - 1
		else 
			l = mid + 1
		end 
	end
	return last
end

print search_range [5,7,7,8,8,10], 8
puts 
print search_range  [5,7,7,8,8,10], 6
puts 
print search_range [], 0
puts 


