#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/linked_list'

# Tests

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)

puts "Build list with length #{list.length}:"
puts list.to_a

puts list.remove(1)
puts "Remove 1 - length is #{list.length}:"
puts list.to_a

puts list.remove(5)
puts "Remove 5  - length is #{list.length}:"
puts list.to_a

puts list.remove(3)
puts "Remove 3 - length is #{list.length}:"
puts list.to_a

puts list.remove(2)
puts list.remove(4)
puts "Remove 2 and 4 - length is #{list.length}"
puts list.to_a