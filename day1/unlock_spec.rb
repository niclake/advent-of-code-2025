require "rspec"
require_relative "unlock"

RSpec.describe Unlock do
  describe "#main" do
    subject = Unlock.new

    it "calculates the correct password for example input" do
      expect { subject.main(true, false) }.to output(/Password: 6/).to_stdout
    end

    it "calculates the correct final position for example input" do
      expect { subject.main(true, false) }.to output(/Final position: 32/).to_stdout
    end
  end
end
