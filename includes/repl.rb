# REPL is responsible for:
#  - starting the read, evaluate, print loop
#  - handling signals passed in by the user and input exceptions
require 'readline'

class Repl
  def self.repl(prompt: '> ')
    loop do
      input = Readline.readline prompt

      break unless input && input != 'f'
      puts process_input(input, &Proc.new)
    end

    rescue SystemExit, Interrupt
      exit
  end

  # Formats the input with the block supplied to repl
  # N.B. this method has been broken out to make it easier to test
  def self.process_input(input)
    yield input
  end
end
