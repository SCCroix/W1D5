require "byebug"
class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    @parent.children.delete(self) if @parent
    @parent = parent_node

    if @parent
      parent_node.children.push(self) unless parent_node.children.include?(self)
    end
  end	

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "did not pass child node" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if self.value == target_value

    self.children.each do |child| 
      search = child.dfs(target_value)
      return search unless search.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = []

    queue.push(self)
    until queue.empty?
      curr_node = queue.shift
      return curr_node if curr_node.value == target_value

      curr_node.children.each { |child| queue.push(child) }
    end

    nil
  end

  def inspect
    @value.inspect
  end
end

if __FILE__ == $PROGRAM_NAME
  a = PolyTreeNode.new('a')
  b = PolyTreeNode.new('b')
  c = PolyTreeNode.new('c')
  d = PolyTreeNode.new('d')
  e = PolyTreeNode.new('e')
  f = PolyTreeNode.new('f')
  g = PolyTreeNode.new('g')

  a.add_child(b)
  a.add_child(c)
  b.add_child(d)
  b.add_child(e)
  c.add_child(f)
  c.add_child(g)

  a.dfs('c')
end

