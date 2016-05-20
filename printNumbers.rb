$arrayOfNumbers = Array.new(16) { |num| num = num + 1}
def printArray (array)
	array.select {|num| puts "#{num}, "}
end

printArray($arrayOfNumbers)
