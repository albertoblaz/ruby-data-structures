#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'tree_node'

class BinarySearchTreeChecker
  class << self
    def call(root)
      return false if root.nil?

      call_children(root)
    end

    private

    def call_children(root)
      if !root.left.nil? && !root.right.nil?
        compare_left(root) && compare_right(root) && call_children(root.left) && call_children(root.right)
      elsif !root.left.nil?
        compare_left(root) && call_children(root.left)
      elsif !root.right.nil?
        compare_right(root) && call_children(root.right)
      else
        true
      end
    end

    def compare_left(root)
      root.left.data <= root.data
    end

    def compare_right(root)
      root.data < root.right.data
    end
  end
end

class BinaryTreePreOrderTraversal
  class << self
    def call(root)
      return [] if root.nil?

      arr = []

      arr << root.data
      call(root.left).each { |d| arr << d }
      call(root.right).each { |d| arr << d }

      arr
    end
  end
end

class BinaryTreeInOrderTraversal
  class << self
    def call(root)
      return [] if root.nil?

      arr = []

      call(root.left).each { |d| arr << d }
      arr << root.data
      call(root.right).each { |d| arr << d }

      arr
    end
  end
end

class BinaryTreePostOrderTraversal
  class << self
    def call(root)
      return [] if root.nil?

      arr = []

      call(root.left).each { |d| arr << d }
      call(root.right).each { |d| arr << d }
      arr << root.data

      arr
    end
  end
end

class BinaryTreeLevelOrderTraversal
  class << self
    def call(root)
      call_arr([root])
    end

    private

    def call_arr(curr_level_nodes)
      arr = []
      next_level_nodes = []

      curr_level_nodes.each do |n|
        arr << n.data
        next_level_nodes << n.left unless n.left.nil?
        next_level_nodes << n.right unless n.right.nil?
      end

      call_arr(next_level_nodes).each { |cn| arr << cn } unless next_level_nodes.empty?

      arr
    end
  end
end

class BinaryTree
  attr_accessor :root
  attr_reader :size

  def initialize
    clear
  end

  def insert_left(node, data)
    node = TreeNode.new(data)

    if empty?
      @root = node
      @size = 1
      return
    end
    

    # TBD
  end

  def insert_right(node, data)
    # TBD
  end

  def remove_left(node)
    return nil if node.nil?
    return nil if node.left.nil?

    if node.leaf?
      node.left = nil
    else

    end

    self
  end

  def remove_right(node)
    # TBD

    self
  end

  def empty?
    @root.nil? && @@size.zero?
  end

  def binary_search_tree?
    BinarySearchTreeChecker.call(@root)
  end

  def clear
    @root = nil
    @size = 0
  end

  def traverse_pre_order
    BinaryTreePreOrderTraversal.call(@root)
  end

  def traverse_in_order
    BinaryTreeInOrderTraversal.call(@root)
  end

  def traverse_post_order
    BinaryTreePostOrderTraversal.call(@root)
  end

  def traverse_level_order
    BinaryTreeLevelOrderTraversal.call(@root)
  end
end