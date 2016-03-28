#!/usr/bin/env ruby

require './includes/repl'
require './includes/calculator'

calc = Calculator.new

# Start the loop
Repl::repl do |input|
  calc.add_input input
end
