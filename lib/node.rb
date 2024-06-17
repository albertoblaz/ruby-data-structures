#!/usr/bin/env ruby
# frozen_string_literal: true

class Node
  attr_accessor :data
  attr_accessor :next

  def initialize(data, node = nil)
    @data = data
    @next = node
  end
end