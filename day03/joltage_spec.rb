require "rspec"
require_relative "joltage"

RSpec.describe Joltage do
  describe "#main" do
    subject = Joltage.new

    it "finds the correct joltages for each example input" do
      expect { subject.main(true, false) }.to output(/Total output joltage: 98 \+ 89 \+ 78 \+ 92/).to_stdout
    end

    it "calculates the correct sum of joltages for example input" do
      expect { subject.main(true, false) }.to output(/Sum of joltage: 357/).to_stdout
    end
  end
end
