require "precommit4j/version"
require 'optparse'
require 'open3'

module PreCommit4J
    module CheckStyle
      class Executor

        def execute
          cli_options = {}
          OptionParser.new do |parser|
            parser.on("-c CONFIG_FILE", "Required: The checkstyle XML config file")
            parser.on("--jar JAR_FILE", "Optional: The path to the Jar file")
            parser.on("-d", "--debug", "Optional: Enable the debug of checkstyle.jar as part of output")
            parser.on("-E", "--executeIgnoredModules", "Optional: Allows ignored checkstyle modules to be run")
          end.parse!(into: cli_options)
          invoke_checkstyle_jar(cli_options, ARGV)
        end

        def invoke_checkstyle_jar(cli_options, files)
          jar_file = cli_options.include?(:jar) ? cli_options[:jar] : File.expand_path("../../../../checkstyle.jar", __FILE__)
          checkstyle_options = "-c #{cli_options[:c]}"
          checkstyle_options = checkstyle_options + " -d " if cli_options[:debug]
          checkstyle_options = checkstyle_options + " -E " if cli_options[:executeIgnoredModules]
          stdout, stderr, status = Open3.capture3("java -jar #{jar_file} #{checkstyle_options} #{files.join(" ")}")
          puts stdout
          puts stderr
          status.success?
        end
    end
  end
end