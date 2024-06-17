#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'node'

class Stack
  attr_reader :top
  attr_reader :length

  def initialize
    clear
  end

  def push(data)
    @top = Node.new(data, @top)
    @length += 1

    @top
  end

  def pop
    return if empty?

    node = @top
    @top = @top.next
    @length -= 1

    node
  end

  def clear
    @top = nil
    @length = 0
  end

  def empty?
    @top.nil? && @length.zero?
  end

  def to_a
    return [] if empty?

    arr = [@top.data]
    curr = @top.next

    while !curr.nil?
      arr << curr.data
      curr = curr.next
    end

    arr
  end
end