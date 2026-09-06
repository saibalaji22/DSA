# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    l = 0 
    h = nums.size - 1
    while l <= h 
    	mid = l + (h - l) / 2

    	if nums[mid] == target 
    		return mid 
    	end 
    	#left half sorted 
    	if nums[l] <= nums[mid]
    		#check if the target lies in that sorted left half 
    		# if yes eliminate right half 
    		# if not eliminate left half 
    		if nums[l] <= target && target <= nums[mid]
    			
    			h = mid - 1
    		else 
    			#
    			l = mid + 1
    		end
    	#if not then right half will be sorted 
    	else 
    		#check if the target lies in that sorted right half 
    		# if yes eliminate left half 
    		# if not eliminate right half 
    		if nums[mid] <= target && target <= nums[h]
    			l = mid + 1
    		else 
    			h = mid - 1
    		end
    	end
    end 

    return -1 
end


puts search [4,5,6,7,0,1,2], 0
puts search [4,5,6,7,0,1,2], 3