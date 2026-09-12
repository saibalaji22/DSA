# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
=begin 
Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return the minimum integer k such that she can eat all the bananas within h hours.
=end

def min_eating_speed(piles, h)
    #the search space is speed k
    l = piles.min 
    high = piles.max 
    min_speed = Float::INFINITY

    while l <= high
    	mid = l + (high - l) / 2
    	if check_if_valid(piles,mid,h)
    		# this can be the answer but we need minimum speed so move left 
    		min_speed = mid 
    		high = mid - 1
    	else 
    		l = mid + 1
    	end
    end
    return min_speed

end

#to check if koko can eat all the piles at a speed of k within h hours
def check_if_valid(piles,k,h)
	total_hours = 0
	piles.each do |pile|
		total_hours += (pile / k.to_f).ceil 
	end
	return total_hours <= h
end

puts min_eating_speed [3,6,7,11], 8