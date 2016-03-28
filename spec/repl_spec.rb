require './includes/repl'

RSpec.describe Repl, type: :model do
  it "yeilds control to the block given" do
    expect { |b| Repl::process_input(1, &b) }.to yield_control
  end

  it "processes the input with the block given" do
    expect(Repl::process_input(1) { |input| input * 3 }).to be 3
  end
end
