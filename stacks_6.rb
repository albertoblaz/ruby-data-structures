#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/stack'

def shift_stacks(stack, buffer, items_no)
  min = Float::INFINITY
  len = items_no

  while len > 0
    top = stack.pop()
    if top.data < min
      min = top.data
    end

    buffer.push(top.data)
    len -= 1
  end

  min
end

def shift_stacks_skipping_min_value(stack, buffer, min)
  while !buffer.empty?
    top = buffer.pop()
    stack.push(top.data) if top.data != min
  end
end

def sort_asc(stack)
  buffer = Stack.new
  length = stack.length
  
  while length > 0
    min = shift_stacks(stack, buffer, length)
    stack.push(min)
    shift_stacks_skipping_min_value(stack, buffer, min)
    length -= 1
  end

  stack
end

s = Stack.new
s.push(4)
s.push(1)
s.push(-4)
s.push(7)
s.push(0)

puts "Stack"
puts s.to_a

puts "Stack sorted asc"
puts sort_asc(s).to_a