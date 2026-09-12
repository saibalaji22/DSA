# @param {Integer[]} weights
# @param {Integer} days
# @return {Integer}
=begin 
A conveyor belt has packages that must be shipped from one port to another within days days.
The ith package on the conveyor belt has a weight of weights[i]. 
Each day, we load the ship with packages on the conveyor belt (in the order given by weights). 
We may not load more weight than the maximum weight capacity of the ship.
Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within days days.
=end 

def ship_within_days(weights, days)
    #the search space is weight capacity of ship 
    l = weights.max  #this cannot be weights.min because in that case you cant load all the weights into the ship
    h =  weights.sum 
    min_capacity = Float::INFINITY

    while l <= h
    	mid = l + (h - l) / 2
    	if check_validity(weights,days,mid)
    		#may be answer but we need min capacity so move left
    		min_capacity = mid 
    		h = mid - 1
    	else 
    		l = mid + 1
    	end
    end
    return min_capacity
end


#to check if weights can be shipped within days in given capacity ship 
def check_validity(weights,days,capacity)
	days_count = 1 #atleast 1 day will be taken to load all
	current_weight = 0

	weights.each do |weight|
		if current_weight + weight > capacity
			days_count += 1
			current_weight = weight 
		else
			current_weight += weight
		end
	end

	return days_count <= days
end

puts ship_within_days [1,2,3,4,5,6,7,8,9,10], 5
