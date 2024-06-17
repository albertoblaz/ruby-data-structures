#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/binary_tree'
require_relative 'lib/tree_node'

tree = BinaryTree.new

four = TreeNode.new(4)
five = TreeNode.new(5)
two = TreeNode.new(2, four, five)

six = TreeNode.new(6)
three = TreeNode.new(3, nil, six)

one = TreeNode.new(1, two, three)

tree.root = one

puts "Traverse pre-order:"
puts tree.traverse_pre_order.join(",")

puts "Traverse in-order:"
puts tree.traverse_in_order.join(",")

puts "Traverse post-order:"
puts tree.traverse_post_order.join(",")

puts "Traverse level-order:"
puts tree.traverse_level_order.join(",")

tree2 = BinaryTree.new
tree2.root = TreeNode.new(13, TreeNode.new(4), TreeNode.new(20, TreeNode.new(15)))

puts "tree2 - Binary Search Tree?"
puts tree.binary_search_tree?
puts "tree2 - Binary Search Tree?"
puts tree2.binary_search_tree?