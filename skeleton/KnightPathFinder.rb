require '00_tree_node'

class KnightPathFinder

  def initialize(start_pos)
    self.root_node = PolyTreeNode.new(start_pos)
  end

  def self.valid_moves(pos)
    if pos.first >= 0 && pos.first < 8 && pos.last >= 0 && pos.last < 8
        return true
    end
    false
  end

  def find_path(end_pos)
    @end_pos = end_pos
  end
end