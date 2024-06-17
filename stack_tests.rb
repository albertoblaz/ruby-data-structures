#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/stack'

# Tests

s = Stack.new
s.push(1)
s.push(2)
s.push(3)
s.push(4)

puts "Push 4 items (#{s.length} items inside)"
puts s.to_a

s.pop

puts "Pop 1 item (#{s.length} items left)"
puts s.to_a

s.clear

puts "Clear stack (#{s.length} items left)"
puts s.to_a
