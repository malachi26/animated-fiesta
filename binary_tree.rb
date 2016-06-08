class Node
  include Enumerable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end
  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  # @return [Object]
  def <=> (other_node)
    data <=> other_node.data
  end
end

root = Node.new(3)
root.left = Node.new(2)
root.right = Node.new(1)

puts 'SUM'
#root.each {|z| puts z.data } #will print "3 7 12"
puts root.inject(0) { |memo, node| memo += node.data }
puts 'MAX'
puts root.max.data
puts 'SORT'
puts root.sort.map(&:data)


