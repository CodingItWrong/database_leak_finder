module DatabaseLeakFinder
  module Handler
    class << self
      attr_reader :options

      def log_example(example)
        @example = example
      end

      def find_leaks
        leaks = finder.process
        error_reporter.report(@example, leaks) unless leaks.empty?
      end

      def config(options)
        @options = options
      end

      private
      def finder
        @finder ||= DatabaseLeakFinder::Finder.new(@options)
      end

      def logger
        @logger ||= DatabaseLeakFinder::Logger.new
      end

      def error_reporter
        @error_reporter ||= DatabaseLeakFinder::ErrorReporter.new
      end
    end
  end
end