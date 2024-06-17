#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/linked_list'

def list_to_number(list)
  acc_a = 0
  mult_a = 1
  curr_a = list.first

  # 7->1->6
  # 7*1 + 1*10 + 6*100 = 600 + 10 +7 = 617
  while !curr_a.nil?
    acc_a += mult_a * curr_a.data
    mult_a *= 10
    curr_a = curr_a.next
  end

  acc_a
end

def number_to_list(number)
  div = 10
  list = nil
  prev_number = nil
  quo = Float::INFINITY

  # number = 935
  # 935 / 10 = 93.5 (> 1)
  # 935 % 10 = 5

  # 935 / 100 = 9.35 (> 1)
  # 935 % 100 = 35 -> 35 - 5 = 30 / (div/10) = 30 / 10 = 3

  # 935 / 1000 = 0.935 (< 1)
  # 935 % 1000 = 935 -> 935 - 30 - 5 = 900 -> 900 / (1000/10) = 900 / 100 = 9

  while quo >= 1
    quo = number / div
    mod = number % div

    unless prev_number
      list = LinkedList.new
      list.append(mod)
    else
      adjusted_mod = (mod - prev_number) / (div / 10)
      list.append(adjusted_mod)
    end

    prev_number = mod
    div *= 10
  end

  list
end

def sum_lists(a, b)
  acc_a = list_to_number(a)
  acc_b = list_to_number(b)

  acc_c = acc_a + acc_b
  
  number_to_list(acc_c)
end

# Example

list_a = LinkedList.new
list_a.append(7)
list_a.append(1)
list_a.append(6)

puts "List A:"
puts list_a.to_a
puts list_to_number(list_a)

list_b = LinkedList.new
list_b.append(5)
list_b.append(9)
list_b.append(2)

puts "List B:"
puts list_b.to_a
puts list_to_number(list_b)

list_c = sum_lists(list_a, list_b)
puts "List C:"
puts list_c.to_a