#!/usr/bin/env ruby

require 'optparse'
require 'pp'
require_relative './translate_functions.rb'

options = {}

OptionParser.new do |opts|
  opts.banner = "\nMorse translator and obfuscator Ruby CLI app.\n"

  opts.on("-t 'one, two, three'", '--text', Array, 'Text input. Accpets one or multiple string inputs') do |t|
    options[:text] = t
  end

  opts.on('-f src/input.txt', '--file', 'File input. Read input text from file.') do |f|
    options[:file] = f
  end

  opts.on('-h', '--help', 'Displays help') do
    puts opts
    exit
  end
end.parse!

def print_result(output)
  puts "\nNo output to print\n" unless output
  puts format("\nObfuscated morse code\n\n%s\n\n", output.join("\n"))
end

if options[:text]
  output = translate_and_obfuscate(options[:text])
  print_result(output)
end

translate_and_obfuscate_file_input(options[:file]) if options[:file]
