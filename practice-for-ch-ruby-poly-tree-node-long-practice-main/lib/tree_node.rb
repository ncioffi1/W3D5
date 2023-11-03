class PolyTreeNode
    # testing

    attr_reader :children, :value, :parent
    # attr_accessor :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
      @parent.children.delete(self) if @parent != nil  

      if new_parent != nil
        @parent = new_parent
        new_parent.children << self
      else
          @parent = nil
      end
    end 

    def add_child(node)
        @children << node
        #itself => node
        # parent of node = node
    end

    def remove_child(node)

      if !self.children.include?(node)
        raise "error"
      else
        node.parent = nil
      end

    end
end