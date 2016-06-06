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
		block.call self
	end
	
	def add_to_tree(element_to_add, children[])
		children.push(element_to_add)
	end
	
	def up_tree
		
	end
	
	def down_tree (branch_name)
		
	end
end

