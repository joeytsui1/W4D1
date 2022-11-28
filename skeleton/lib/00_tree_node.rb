class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if @parent != nil
            @parent.children.delete(self)
            @parent = parent
            @parent.children << self
        else
            @parent = parent
            @parent.children << self
        end
    end

    def add_child(child)
        
    end
end 