#require "byebug"

class PolyTreeNode
  attr_accessor :parent, :value, :children
  attr_reader :old_parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  #returns nodes parents
  def parent
    @parent
  end

  #returns array of children of node
  def children
    @children
  end

  #returns value stored at the node
  def value
    @value
  end

  #sets the parent property, adds node to parent array of children unless parent = nil
  def parent=(arg_parent=nil)
    if arg_parent == nil
      @parent = nil
    else
      if self.parent
        self.parent.children.delete(self)
      end
      @parent = arg_parent
      if arg_parent.children.include?(self) == false
        arg_parent.children << self
      end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "WRONG! THIS ISNT A CHILD"
    end
  end

  def dfs(target_value)

    result = []

    if target_value == self.value
      return nil
    else

    self.children.each do |x|
      result = x.dfs(target_value)
        return result unless result.nil?
      end
    end
    
  end





end
      # if x.children != nil   #x.value == nil
