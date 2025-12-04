#!/usr/bin/env ruby

class Joltage
  def main(test = false, log = false)
    input_file = test ? "example.txt" : "input.txt"
    input = File.read(File.join(File.dirname(__FILE__), input_file)).strip
    bank_joltage = []

    banks = input.split("\n")
    banks.each do |bank|
      batteries = bank.chars.map(&:to_i)
      battery_needed = 2
      battery_indexes = []
      battery_values = []

      # b1_index = index_of_max(batteries[0..batteries.length - battery_needed])
      # battery_indexes << b1_index
      # shift = b1_index + 1
      remaining_batteries = batteries.dup
      # prev_max = batteries[b1_index]

      battery_values += batteries.max(battery_needed)

      battery_values.each do |value|
        puts "Looking for value #{value} in #{batteries}" if log
        index = 
          # value == prev_max ?
          #   remaining_batteries.each_index.select { |i| remaining_batteries[i] == value }.first + shift :
            remaining_batteries.each_index.select { |i| remaining_batteries[i] == value }.max
        puts "Found value #{value} at index #{index}" if log
        battery_indexes << index
        puts "Current battery indexes: #{battery_indexes}" if log
        remaining_batteries[index] = nil
      end

      battery_indexes = battery_indexes.sort

      puts "Selected battery indexes for bank: #{battery_indexes}" if log
      puts "Voltage will be #{batteries.values_at(*battery_indexes).join(', ')}" if log
      bank_joltage << batteries.values_at(*battery_indexes).join.to_i
    end

    puts "Total output joltage: #{bank_joltage.join(" + ")}"
    puts "Sum of joltage: #{bank_joltage.sum}"
  end

  private

  def index_of_max(arr)
    arr.index(arr.max)
  end

  def index_of_value_shifted(arr, value, shift)
    arr.index(value) + shift
  end
end

Joltage.new.main(ARGV[0] == "true", ARGV[1] == "true")