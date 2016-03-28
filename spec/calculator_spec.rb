require './includes/calculator'

RSpec.describe Calculator, type: :model do
  before do
    @c = Calculator.new
  end

  it "starts with an empty list of values" do
    expect(@c.args.count).to be 0
  end

  context "adds an integer to its stored list of args" do
    it "when the number is an an integer" do
      @c.add_input(1)
      expect(@c.args.count).to eql 1
    end

    it "adds an integer in a string" do
      @c.add_input('1')
      expect(@c.args.count).to eql 1
    end
  end

  context "adds an float to its stored list of args" do
    it "when the number is an an integer" do
      @c.add_input(1.01)
      expect(@c.args.count).to eql 1
    end

    it "adds an integer in a string" do
      @c.add_input('1.01')
      expect(@c.args.count).to eql 1
    end
  end

  context "processes the commands" do
    it "adds values" do
      ['1','2','3'].each { |i| @c.add_input i }
      expect(@c.add_input('+')).to be 6
    end

    it "subtracts values" do
      ['10','2','3'].each { |i| @c.add_input i }
      expect(@c.add_input('-')).to eql 5
    end

    it "divides values" do
      [15, 5].each { |i| @c.add_input i }
      expect(@c.add_input('/')).to eql 3
    end

    it "multiplies values" do
      [1, 2, 3].each { |i| @c.add_input i }
      expect(@c.add_input('*')).to eql 6
    end

    it "returns an error message when an invalid value is given" do
      expect(@c.add_input 'This is not a real argument!').
        to eql "Unrecognized Input:\nPlease enter a number or an operator (+, -, * or /)"
    end
  end


  it "return 0 when attempted to divide by 0" do
    [0, 0].each { |i| @c.add_input i }
    expect(@c.add_input('/')).to eql "You cannot divide by 0"
  end

  it "clears inputs when given clear" do
    [1, 2, 3].each { |i| @c.add_input i }
    @c.add_input('clear')
    expect(@c.args.count).to eql 0
  end

  it "prints a help message when given help" do
    message = """
Reverse Polish Notation Calculator:
enter a list of values
then enter an arthmetic operator (+, -. * or /)

You can also input:
clear - reset the previous list of input
help  - show this help message
"""
    expect(@c.add_input "help").to eql message
  end

  it "handles no input" do
    expect(@c.add_input :+ ).to be nil
  end

  it "handle a single input" do
    @c.add_input(345)
    expect(@c.add_input :+ ).to eql 345
  end

  it "handles spaces arount the input" do
    @c.add_input "    234    "
    expect(@c.args[0]).to be 234
  end

  it "handles other whitespace arount the input" do
    @c.add_input "    234    \r\n"
    expect(@c.args[0]).to be 234
  end

  context "handles negative numbers" do
    before do
      [1, 2, 3].each { |i| @c.add_input i }
    end

    it "when it has negative integers" do
      @c.add_input( -6 )
      expect( @c.add_input(:+) ).to eql 0
    end

    it "when it has some negative floats" do
      @c.add_input( - 6.0 )
      expect( @c.add_input(:+) ).to eql 0.0
    end
  end
end
