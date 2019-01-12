require_relative "PolyTreeNode"

class KnightsTravails
  attr_reader @position

  def initialize(starting_position)
    @position = PolyTreeNode.new(starting_position)
    @possible_moves = [-2,-1,1,2].permutation(2).to_a.reject { |x,y| x.abs == y.abs }
  end





end