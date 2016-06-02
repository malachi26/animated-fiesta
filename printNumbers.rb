arrayOfNumbers = Array.new(16) { |num| num = num + 1}

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

def sslice4 (array, sliceSize)
	array.each_slice(sliceSize) {
		|x| 
		puts "Next Slice" 
		puts x
	}	
end

printBatchesOfFour(arrayOfNumbers)
puts "then we slice it up"
sslice4(arrayOfNumbers, 8)
puts "Slice it Smaller"
sslice4(arrayOfNumbers, 4)
puts "Slice it Smaller!"
sslice4(arrayOfNumbers, 2)