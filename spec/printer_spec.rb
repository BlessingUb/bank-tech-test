require 'printer'
describe Printer do
  describe '#print'
    it "returns the argument inserted into print" do         
      expect { subject.print("something")}.to output("something\n").to_stdout
    end
  end