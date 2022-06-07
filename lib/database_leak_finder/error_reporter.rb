module DatabaseLeakFinder
  class ErrorReporter
    def report(example, leaks)
      message = "After spec '#{spec_path_for(example)}' the following rows were in the database: "
      raise message + leaks.map(&method(:format_leak)).join(', ')
    end

    private
    def spec_path_for(example)
      example.metadata[:example_group][:file_path]
    end

    def format_leak(table, count)
      "#{count} #{'row'.pluralize(count)} for the #{table} table"
    end
  end
end
