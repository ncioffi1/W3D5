class PolyTreeNode
    # testing

    attr_reader :children, :value, :parent
    # attr_accessor :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node != nil
            @parent = node
            node.add_child(self)
        else
            @parent = nil
        end
    end 

    def add_child(node)
        @children << node
    end
end