require_relative '00_tree_node.rb'

class KnightPathFinder

  def self.create_grid
    grid = Array.new(8) {Array.new(8)}

    arr1 = (1..8).to_a
    arr2 = ('a'..'h').to_a

    arr1.each.with_index {|n, i| arr2.each.with_index {|c, j| grid[i][j] = (c + n.to_s).to_sym}}
    grid

  end

  @@moves = [[1,2], [1,-2], [2,1], [2,-1], [-1,2], [-1,-2], [-2,1], [-2,-1]]
  @@grid = KnightPathFinder.create_grid

  def initialize(pos)

    @pos = PolyTreeNode.new(pos)
    @considered_pos = [pos]
    
  end

  def self.valid_moves(pos)
    
    possible_moves = [pos]
    @@moves.each {|spot|

      row, col = spot[0], spot[1]

      next if row + pos[0] < 0 || row + pos[0] > 7
      next if col + pos[1] < 0 || col + pos[1] > 7
        
      if @@grid[pos[0]+ row][pos[1]+col] != nil
        possible_moves << [pos[0]+ row,pos[0]+ col]
      end
    }

   possible_moves

  end
  def new_move_positions
    possibilities = KnightPathFinder.valid_moves(@pos.value)
    new_spot = possibilities.select {|pos| !@considered_pos.include?(pos)}
    @considered_pos.concat(new_spot)
    new_spot
  end

end


# p KnightPathFinder.valid_moves([4,3])
# k = KnightPathFinder.new([4,3])
# p k.new_move_positions


