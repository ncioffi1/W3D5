require_relative "tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        # pos = [x, y]
        changes = [[2, 1], [1, 2], [-2, 1], [-1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2]]
        # new_arr = []
        my_valid_moves = []
        changes.each do |change|
            x = pos[0] + change[0]
            y = pos[1] + change[1]
            if x < 7 && x > 0 && y < 7 && y > 0
                my_valid_moves << [x, y]
            end
        end
        return my_valid_moves
    end

    # x 0 to 7
    # y 0 to 7
    attr_accessor :pos, :considered_positions, :root_node
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end


    def find_path(end_pos)

    end

    def build_move_tree(starting_node)
        nodes = [starting_node]
        while !nodes.empty? 
            new_positions = new_move_positions(nodes[0].value)
            new_positions.each do |pos|
                node = PolyTreeNode.new(pos)
                starting_node.add_child(node)
                nodes << node
            end
            nodes.shift
        end
        starting_node
    end

    def new_move_positions(pos)
        valids = KnightPathFinder.valid_moves(pos)
        arr2 = valids.select {|move| !@considered_positions.include?(move)}

        arr2.each do |move|
            @considered_positions << move
        end
        arr2
    end
end

p "==="
# p KnightPathFinder.valid_moves([0, 0])
# p KnightPathFinder.valid_moves([4, 4])
k = KnightPathFinder.new([0, 0])
# k.new_move_positions([0, 0])
# p k.pos
# p k.considered_positions
p k.build_move_tree(k.root_node)
# k.considered_positions[0][0] = 1
# p k.pos
# p k.considered_positions
