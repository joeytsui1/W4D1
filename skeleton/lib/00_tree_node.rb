# require 'byebug'

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent=nil)
        if @parent && parent
            @parent.children.delete(self)
            @parent = parent
            @parent.children << self
        else
          if parent
            @parent = parent
            @parent.children << self
          else
            @parent = parent
          end
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
            child_node.parent = nil
        else
            raise RuntimeError.new("node is not a child")
        end
    end

    def dfs (target)
        return self if self.value == target
        return nil if self.children.empty?

        self.children.each do |child|
            el = child.dfs(target)
            if !el.nil?
                return el
            end
        end
        return nil
    end

    def bfs (target)
        arr = [self]

        until arr.empty?
            current = arr.shift
            if current.value == target
                return current
            else
                arr.concat(current.children)
            end
        end
        return nil
    end
end 