#!/usr/bin/env ruby

require './includes/repl'
require './includes/calculator'

calc = Calculator.new

# Start the loop
Repl::repl do |input|
  input = calc.add_input(input)
  input.is_a?(Numeric) ? sprintf("%g", input) : input
end
