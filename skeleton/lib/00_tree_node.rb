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
      self.children << child

    end

    def remove_child(child_node)

      self.children.delete(child_node)
      child_node.parent = nil

    end
end 