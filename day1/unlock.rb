#!/usr/bin/env ruby

class Unlock
  DIAL_SIZE = 100
  START_POSITION = 50

  def main(test = false, log = false)
    input_file = test ? "example.txt" : "input.txt"
    input = File.read(File.join(File.dirname(__FILE__), input_file)).strip
    instructions = input.split("\n")

    position = START_POSITION
    password = 0

    instructions.each do |instruction|
      direction, amount = instruction[0], instruction[1..].to_i
      position, zero_crossings = rotate_dial(position, direction, amount)

      if log
        msg = "The dial is rotated #{instruction} to point at #{position}"
        msg += "; during this rotation, it points at `0` #{zero_crossings} times" if zero_crossings > 0
        puts msg
      end

      password += zero_crossings
      password += 1 if position == 0
    end

    puts "Final position: #{position}"
    puts "Password: #{password}"
  end

  private

  def rotate_dial(current_position, direction, amount)
    position = current_position
    zero_crossings = 0
    step = (direction == "R") ? 1 : -1

    amount.times do |i|
      position = (position + step) % DIAL_SIZE
      zero_crossings += 1 if position == 0 && i < amount - 1
    end

    [position, zero_crossings]
  end
end

Unlock.new.main(ARGV[0] == "true", ARGV[1] == "true")
