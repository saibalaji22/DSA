# @param {Integer[]} bloom_day
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
=begin
You are given an integer array bloomDay, an integer m and an integer k.

You want to make m bouquets.
 To make a bouquet, you need to use k adjacent flowers from the garden.

The garden consists of n flowers, the ith flower will bloom in the bloomDay[i] and then can be used in exactly one bouquet.

Return the minimum number of days you need to wait to be able to make m bouquets from the garden. If it is impossible to make m bouquets return -1. 
=end

def min_days(bloom_day, m, k)
	#bloom_day size gives number of flowers 
	#if the no of bq needed exceeds the no of flowers present then return -1 
	if bloom_day.size < m * k
		return - 1
	end
	#we need to find minimum number of days to make m bqs.
	#the search space is days 

    min_no_of_days = -1 
    l = bloom_day.min 
    h = bloom_day.max 

    while l <= h
    	mid = l + (h - l) / 2
    	if check_validity(bloom_day,mid,m,k)
    		min_no_of_days = mid 
    		h = mid - 1
    	else 
    		l = mid + 1
    	end
    end
    return min_no_of_days
end

def check_validity(bloom_day,selected_days_count,m,k)
	bq_count = 0
	consecutive_days = 0
	bloom_day.each do |day|
		if day <= selected_days_count
			consecutive_days += 1
			if consecutive_days == k 
				bq_count += 1
			end

		else
			consecutive_days = 0
		end
	end
	return bq_count >= m #we need to make atleast m bqs in selcted days
end


puts min_days [1,10,3,10,2], 3, 1