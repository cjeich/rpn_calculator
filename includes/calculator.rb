# Calculator is responsible for taking inputs keeping track of arguments and
#   processing operators like +, -, /, *

class Calculator
  attr_reader :args

  def initialize
    @args = []
  end

  def add_input(input)
    case "#{input}".strip
    when /^-?\d+(\.\d+)?$/
      store_input input.to_f
    when /^[\+\-\*\/]$/
      process_command(input)
    when 'clear'
      clear_inputs
    when 'help'
"""
Reverse Polish Notation Calculator:
enter a list of values
then enter an arthmetic operator (+, -. * or /)

You can also input:
clear - reset the previous list of input
help  - show this help message
"""
    else
      "Unrecognized Input:\nPlease enter a number or an operator (+, -, * or /)"
    end
  end

  def clear_inputs
    @args = []
  end

  private
  def process_command(command)
    @args = [@args.inject(command)]
    sprintf("%g", @args[0])

    rescue ZeroDivisionError
      "You cannot divide by 0"
  end

  def store_input(input)
    @args << input
    sprintf("%g", @args.last)
  end
end
