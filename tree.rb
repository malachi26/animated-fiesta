#
# I found a nice little site that allows me to run Ruby in my browser
#
# https://repl.it/languages/ruby
#

class Tree
	attr_accessor :children, :node_name
	def initialize(name, children=[])
		@children = children
		@node_name = name
	end
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	def visit(&block)
		yield self
	end
	def add_to_tree(element_to_add)
		children.push(element_to_add)
	end
end
    
# ruby_tree = Tree.new("ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
# puts "Visiting a node"
# ruby_tree.visit {|node| puts node.node_name }
# puts "visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}


puts "let's create a basic family tree"
puts "what is the top of the tree?"
rootName = gets.chomp
puts "#{rootName}"
#root = Tree.new(rootName)
puts "how many direct children are there?"
numChildren = Integer(gets)
puts "#{numChildren} children, huh?"
for i in 1..numChildren
	puts "what is the first child's name?"
	child.push(gets) 
	puts "does this child have any children?"
	if gets == "yes"
		puts "how many"
		numGrandChildren = Integer(gets)
		for i in 1..numGrandChildren
			if i == 1
				puts "what is the grandchild's name?"
				grandchild.push(gets)
			else
				puts "what is the next grandchild's name?"
				grandchild.push(gets)
			end
		end 
	end
	/*
		need to work on making the actual tree from the information that I have
		already gathered, hopefully this shouldn't be too hard, maybe I will work on it tonight 
		20160607
	*/
	
	#root.add_to_tree(Tree.new(gets))
end
root.visit_all {|node| puts "#{node}.#{node.node_name}"}
puts "do any of these children have children?"
if gets.chomp == "yes"
	puts "which child?"
	childName = gets.chomp
	puts "how many children does this child have?"
	numChildren = Integer(gets)
	for i in 1..numChildren
		if i == 1
			puts "Child's name please"
			grandchild = gets
			current_tree_root = root{childName}
			current_tree_root.add_to_tree(Tree.new(grandchild))
		else
			puts "Next child's name please"
			current_tree_root = root{childName}
			current_tree_root.add_to_tree(Tree.new(grandchild))
		end
	end
end


/*
{
	'granpda' => 
	{
		'dad' => 
		{
			'child1' => {}, 
			'child2' => {}
		}, 
		'uncle' => 
		{
			'child3' => {}, 
			'child4' => {}
		}
	}
}
*/