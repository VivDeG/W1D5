class PolyTreeNode
    attr_accessor :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        old_parent = @parent
        if old_parent != nil
            old_parent.children.delete(self)
        end 
        @parent = parent
        if parent != nil
            if !@parent.children.include?(self) 
              @parent.children << self
            end
        end
    end

    def remove_child(child_node)
        raise "ERROR" if !self.children.include?(child_node)
        child_node.parent=(nil)
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def dfs(target_value)
        if @value == target_value
            return self
        end
        @children.each do |child|
            result = child.dfs(target_value)
            if result != nil
                return result
            end
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            result = queue.shift
            return result if result.value == target_value
            result.children.each do |child|
                queue << child 
            end 
        end
        nil 
    end
end