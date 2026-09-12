# @param {Integer[]} nums
# @param {Integer} threshold
# @return {Integer}
=begin 
Given an array of integers nums and an integer threshold, we will choose a positive integer divisor, divide all the array by it, and sum the division's result. Find the smallest divisor such that the result mentioned above is less than or equal to threshold.

Each result of the division is rounded to the nearest integer greater than or equal to that element. (For example: 7/3 = 3 and 10/2 = 5).

The test cases are generated so that there will be an answer.
=end 

def smallest_divisor(nums, threshold)
	l = 1
	h = nums.max 
	min_divisor = Float::INFINITY

	while l <= h 
		mid = l + (h - l) / 2
		if check_valid(mid,nums,threshold)
			min_divisor = mid 
			h = mid - 1
		else 
			l = mid + 1
		end
	end

	return min_divisor
end

def check_valid(divisor,nums,threshold)
	ans = 0
	nums.each do |num|
		ans = ans + (num / divisor.to_f).ceil
	end
	return ans <= threshold
end

puts smallest_divisor [1,2,5,9], 6