module Searchable
    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
    
        return self if prc.call(self)
    
        children.each do |child|
          result = child.dfs(&prc)
          return result unless result.nil?
        end
    
        nil
      end
end

class PolyTreeNode
    include Searchable

    attr_reader :parent
    attr_accessor :value


    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def children
        @children.dup
    end

    def parent=(parent)
        return if self.parent == parent
    
        # First, detach from current parent.
        if self.parent
          self.parent._children.delete(self)
        end
    
        # No new parent to add this to.
        @parent = parent
        self.parent._children << self unless self.parent.nil?
    
        self
     end

    def add_child(child)
        child.parent = self
    end

    def remove_child (child)
        if child && !self.children.include?(child)
            raise "not a child"
        end
      child.parent = nil
    end


    protected
  
  # Protected method to give a node direct access to another node's
  # children.
  def _children
    @children
  end

  def bfs(target = nil, &prc)
    raise "Need a proc or target" if [target, prc].none?
    prc ||= Proc.new { |node| node.value == target }

    nodes = [self]
    until nodes.empty?
      node = nodes.shift

      return node if prc.call(node)
      nodes.concat(node.children)
    end

    nil
  end

  def count
    1 + children.map(&:count).inject(:+)
  end

end


