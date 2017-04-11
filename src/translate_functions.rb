require_relative './morse_code_translator.rb'
require_relative './morse_code_obfuscator.rb'

def translate_and_obfuscate(input)
  output = []
  translator = MorseCodeTranslator.new
  obfuscator = MorseCodeObfuscator.new

  input.each do |i|
    morse_code = translator.translate(i)
    obfuscated_morse_code = obfuscator.obfuscate(morse_code)
    output << obfuscated_morse_code
  end
  output
end

def translate_and_obfuscate_file_input(file_path)
  input = File.readlines(file_path)
  output = translate_and_obfuscate(input)
  print_result(output)
rescue
  puts format("\n%s\n\n", 'File not found!')
end
