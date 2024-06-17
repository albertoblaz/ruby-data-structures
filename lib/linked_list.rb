#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :length

  def initialize
    clear
  end

  def first
    @head
  end

  def last
    curr = @head

    while !curr.next.nil?
      curr = curr.next
    end

    curr
  end

  def prepend(data)
    @head = Node.new(data, @head)
    @length += 1

    @head
  end

  def append(data)
    if empty?
      @head = Node.new(data)
      @length += 1
      return @head
    end

    curr = @head

    while !curr.next.nil?
      curr = curr.next
    end

    curr.next = Node.new(data)
    @length += 1

    curr.next
  end

  def remove(data)
    return if empty?

    # Remove 1 from 1->2->3 becomes 2->3
    if @head.data == data
      node = @head
      @head = @head.next
      @length -= 1
      return node
    end

    # Remove 2 from 1->2->3 becomes 1->3
    prev = @head
    curr = @head.next
    while !curr.nil?
      if curr.data == data
        prev.next = curr.next
        @length -= 1
        return curr
      end

      prev = curr
      curr = curr.next
    end

    # Remove 3 from 1->2->3 becomes 1->2
    node = prev.next
    prev.next = nil
    return node
  end

  def remove_first
    return if empty?

    node = @head
    @head = @head.next

    node
  end

  def empty?
    @head.nil? && @length.zero?
  end

  def clear
    @head = nil
    @length = 0
  end

  def to_a
    return [] if empty?
    
    arr = [@head.data]    
    curr = @head.next
    
    while !curr.nil?
      arr << curr.data
      curr = curr.next
    end

    arr
  end
end