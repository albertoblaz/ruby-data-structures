#!/usr/bin/env ruby
# frozen_string_literal: true

class TreeNode
  attr_accessor :data
  attr_accessor :left
  attr_accessor :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def leaf?
    @left.nil? && @right.nil?
  end
end