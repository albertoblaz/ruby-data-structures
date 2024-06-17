#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/queue'

# Tests

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)

puts "Enqueue 4 items (#{q.length} items inside)"
puts q.to_a

q.dequeue

puts "Dequeue 1 item (#{q.length} items left)"
puts q.to_a

q.clear

puts "Clear queue (#{q.length} items left)"
puts q.to_a
