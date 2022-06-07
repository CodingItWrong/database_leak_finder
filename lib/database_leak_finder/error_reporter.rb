require 'highline'

module DatabaseLeakFinder
  class ErrorReporter
    def report(example, leaks)
      raise "THERE WAS AN ERROR"
    end
  end
end
