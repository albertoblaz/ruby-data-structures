#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/stack'

# Tests

def move_disks_to_last_tower(num_disks)
  # stacks = []

  # n.times.do |i|
  #   stacks << Stack.new
  # end

  # stacks

  s1 = Stack.new
  s2 = Stack.new
  s3 = Stack.new

  # Populate first tower with num_disks
  num_disks.downto(1).each |n|
    s1.push(n)
  end
end

def 

stacks = move_disks_to_last_tower(5)

puts "AFTER"
stacks.each_with_index do |s, i|
  puts "Stack #{i+1}:"
  puts s.to_a
end
