#!/usr/bin/env ruby

require 'optparse'
require 'pp'

# This hash will hold all of the options
# parsed from the command-line by
# OptionParser.
options = {}

optparse = OptionParser.new do|opts|
	# TODO: Put command-line options here

	# This displays the help screen, all programs are
	# assumed to have this option.
	opts.on( '-h', '--help', 'Display this screen' ) do
		puts opts
		exit
	end

	options[:hex] = nil
	opts.on( '-h', '--hex rrggbb', "Mandatory argument" ) do|f|
		options[:hex] = f.each_char.to_a.reverse.join
	end

	options[:rgb] = nil
	opts.on( '-r', '--rgb r,g,b', Array, "List of parameters" ) do|l|
		options[:rgb] = l
	end

end

# Parse the command-line. Remember there are two forms
# of the parse method. The 'parse' method simply parses
# ARGV, while the 'parse!' method parses ARGV and removes
# any options found there, as well as any parameters for
# the options. What's left is the list of files to resize.
optparse.parse!

pp "Options:", options
pp "ARGV:", ARGV

red = 0
green = 0
blue = 0

if options[:hex]
	hex = options[:hex].to_s.hex
	rgb = {}
	%w(r g b).inject(hex) {|a,i| rest, rgb[i] = a.divmod 256; rest}
	red = rgb["r"].to_s
	green = rgb["g"].to_s
	blue = rgb["b"].to_s

elsif options[:rgb]
	red = options[:rgb][0]
	green = options[:rgb][1]
	blue = options[:rgb][2]
end

if ARGV.include?("rgb")
	puts "#{red},#{green},#{blue}"
end

if ARGV.include?("hex")
	puts "##{red.to_i.to_s(16)}#{green.to_i.to_s(16)}#{blue.to_i.to_s(16)}"
end