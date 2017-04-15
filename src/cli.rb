#!/usr/bin/env ruby

require 'optparse'
require 'pp'
require_relative './cli_helper.rb'

options = {}

# parse CLI options
OptionParser.new do |opts|
  opts.banner = "\nMorse translator and obfuscator Ruby CLI app.\n"

  help_text = 'Text input. Accpets one or multiple string inputs'
  opts.on("-t 'one, two, three'", '--text', Array, help_text) do |t|
    options[:text] = t
  end

  help_text = 'File input. Read input text from file.'
  opts.on('-f src/input.txt', '--file', help_text) do |f|
    options[:file] = f
  end

  opts.on('-h', '--help', 'Displays help') do
    puts opts
    exit
  end
end.parse!

puts translate_and_obfuscate(options)
