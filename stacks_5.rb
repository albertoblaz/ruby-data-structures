#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/stack'

class MyQueue
  attr_reader :length

  def initialize
    clear
  end

  def enqueue(data)
    while !@inverted_lifo.empty?
      top = @inverted_lifo.pop()
      @buffer.push(top.data)
    end

    @buffer.push(data)

    while !@buffer.empty?
      top = @buffer.pop()
      @inverted_lifo.push(top.data)
    end

    @length += 1

    self
  end

  def dequeue
    return if empty?

    @inverted_lifo.pop()
    @length -= 1

    self
  end

  def clear
    @buffer = Stack.new
    @inverted_lifo = Stack.new
    @length = 0

    self
  end

  def empty?
    @buffer.empty? && @inverted_lifo.empty? && @length.zero?
  end

  def to_a
    @inverted_lifo.to_a
  end
end

q = MyQueue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)

puts "Enqueue 4"
puts q.to_a

q.dequeue
q.dequeue

puts "Dequeue 2"
puts q.to_a

q.clear

puts "Clear"
puts q.to_a