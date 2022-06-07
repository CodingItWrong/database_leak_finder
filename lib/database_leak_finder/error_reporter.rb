module DatabaseLeakFinder
  class ErrorReporter
    def report(example, leaks)
      message_rows =
        ["The spec '#{spec_path_for(example)}' leaves the following rows in the database:"]
        + leaks.each.map(&method(:format_leak))
      raise message_rows.join(' ')
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
