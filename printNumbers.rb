$arrayOfNumbers = Array.new(16) { |num| num = num + 1}

def printArray (array)
	array.each do |num| 
		puts "#{num}"
	end
end

def printSubArray (array, x, y)
	printArray(array[x..y])
end

def printBatchesOfFour (array)
	x = 0
	y = 3
	
	while (x < array.length) do
		puts "print 4 items"
		printSubArray(array, x, y)
		x = x + 4
		y = y + 4
	end
end

printBatchesOfFour($arrayOfNumbers)