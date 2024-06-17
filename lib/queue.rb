#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'node'

class Queue
  attr_reader :first
  attr_reader :last
  attr_reader :length

  def initialize
    clear
  end

  def enqueue(data)
    if empty?
      @first = Node.new(data)
      @last = @first
    else
      @last.next = Node.new(data)
      @last = @last.next
    end

    @length += 1

    self
  end

  def dequeue
    return if empty?

    old_first = @first

    @first = @first.next
    @last = nil if @first.nil?
    @length -= 1

    old_first

    self
  end

  def clear
    @first = nil
    @last = nil
    @length = 0

    self
  end

  def empty?
    @first.nil? && @last.nil? && @length.zero?
  end

  def to_a
    return [] if empty?

    arr = [@first.data]
    curr = @first.next

    while !curr.nil?
      arr << curr.data
      curr = curr.next
    end

    arr
  end
end