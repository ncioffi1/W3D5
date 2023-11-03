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

    def bfs(target)
      new_queue = []
      new_queue << self
      # debugger

      while new_queue.length > 0
        if new_queue[0].value == target
          return new_queue[0]
        else
          new_queue += new_queue[0].children if !new_queue[0].children.nil?
          new_queue.shift
        end
      end
      nil
    end
end