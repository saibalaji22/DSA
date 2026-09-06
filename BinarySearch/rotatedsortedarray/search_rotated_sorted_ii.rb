#the array may have duplicates 
#dont return index. check if elem
#same as without duplciates except trim down the search space 

def search(nums,target)
	l = 0
	h = nums.size - 1
	while l <= h 
		mid = l + (h - l) / 2

		if nums[mid] == target
			return true 
		end
		#trim down the search space
		# since nums[mid] != target so that nums[l] and nums[r] so we can trim down without any problem
		if nums[l] == nums[mid] && nums[mid] == nums[h]
			l += 1
			h -= 1
		end 

		#check which half is sorted 
		if nums[l] <= nums[mid]
			#left half is sorted - check if target lies in that half 
			if nums[l] <= target && target <= nums[mid]
				h = mid - 1
			else 
				l = mid + 1
			end
		
		else 
			#right half is sorted  -  check if target lies in that half 
			if nums[mid] <= target && target <= nums[h]
				l = mid + 1
			else
				h = mid - 1
			end
		end 
	end
	return false 
end

puts search [3,1,2,3,3,10,3], 2
puts search [3,1,2,3,3,10,3], 20