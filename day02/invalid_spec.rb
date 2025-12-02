require "rspec"
require_relative "invalid"

RSpec.describe Invalid do
  describe "#main" do
    subject = Invalid.new

    it "calculates the correct invalid sum for the example input" do
      expect { subject.main(true, false) }.to output(/Sum of invalid numbers: 4174379265/).to_stdout
    end
  end
end
