require 'optparse'
require 'pp'

module Boulder

	module Command

		require 'command/setup'
		require 'command/install'
		require 'boulder_file'

		def self.run(argv)
			
			# This hash will hold all of the options
			# parsed from the command-line by
			# OptionParser.
			options = {}

subtext = <<HELP
Commonly used command are:
   setup :     setup directory for Boulder
   install :     install all dependencies
 
See 'boulder COMMAND --help' for more information on a specific command.
HELP

			global = OptionParser.new do|opts|

				# This displays the help screen, all programs are
				# assumed to have this option.
				opts.banner = "Usage: boulder [options] [subcommand [options]]"
				opts.on( '-h', '--help', 'Display this screen' ) do
					puts opts
					exit
				end

				opts.on( '-d', '--debug', 'Debug stuff' ) do |d|
					options[:debug] = d
				end

				opts.separator ""
				opts.separator subtext

			end

			subcommands = { 
				'setup' => OptionParser.new do |opts|
					opts.banner = "Usage: setup [options]"
					opts.on("-h", "--h", "Display this screen") do |v|
						puts opts
					end
				end,
				'install' => OptionParser.new do |opts|
					opts.banner = "Usage: install [options]"
						opts.on("-h", "--h", "Display this screen") do |v|
						puts opts
					end
				end
			 }

			# Parse the command-line. Remember there are two forms
			# of the parse method. The 'parse' method simply parses
			# ARGV, while the 'parse!' method parses ARGV and removes
			# any options found there, as well as any parameters for
			# the options. What's left is the list of files to resize.
			global.parse!
			command = ARGV.shift
			subcommands[command].order!

			if options[:debug]
				puts "Command: #{command} "
				p options
				puts "ARGV:"
				p argv
			end

			if command == "setup"
				Boulder::Command::Setup.run(argv, options)
			elsif command == "install"
				Boulder::Command::Install.run(argv, options)
			end

		end

	end

end