require "byebug"

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

    def add_child(new_child)
        new_child.parent = self
    end

    def remove_child(node)
      if !self.children.include?(node)
        raise "error"
      else
        node.parent = nil
      end
    end

    def dfs(target)
        return self if self.value == target
        
        self.children.each do |child|
            result = child.dfs(target)
            if result != nil
                return result
            end
        end
        return nil
    end

    def bfs

    end
end