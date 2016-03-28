# REPL is responsible for:
#  - starting the read, evaluate, print loop
#  - handling signals passed in by the user and input exceptions

class Repl
  def self.repl(prompt: '> ')
    print prompt
    while input = gets
      break unless input && input != 'f\n'
      input = input.chomp

      puts process_input(input, &Proc.new)
      print prompt
    end

    # Catch User input like ^C and exit without throwing errors
    rescue SystemExit, Interrupt
      exit
  end

  # Formats the input with the block supplied to repl
  # N.B. this method has been broken out to make it easier to test
  def self.process_input(input)
    yield input
  end
end
