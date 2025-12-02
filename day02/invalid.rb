#!/usr/bin/env ruby

class Invalid
  def main(test = false, log = false)
    input_file = test ? "example.txt" : "input.txt"
    input = File.read(File.join(File.dirname(__FILE__), input_file)).strip
    ranges = input.split(",")
    sum = 0

    ranges.each do |range|
      invalid_nums = []
      start_int, end_int = range.split("-").map(&:to_i)

      (start_int..end_int).each do |num|
        num_str = num.to_s
        length = num_str.length

        (1..length / 2).each do |divisor|
          next unless length % divisor == 0
          num_array = num_str.chars.each_slice(divisor).map(&:join).uniq
          invalid_nums |= [num] if num_array.count == 1
        end
      end
      
      puts "#{range} has #{invalid_nums.count} invalid numbers" if log
      puts "  #{invalid_nums.join(' and ')}" if log && invalid_nums.any?
      sum += invalid_nums.sum
    end

    puts "Sum of invalid numbers: #{sum}"
  end
end


Invalid.new.main(ARGV[0] == "true", ARGV[1] == "true")