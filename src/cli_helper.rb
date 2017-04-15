require_relative './translator.rb'
require_relative './obfuscator.rb'

# translate and obfuscte input from text or a file
def translate_and_obfuscate(options)
  sentence = options[:text].join("\n") if options[:text]
  if options[:file]
    sentence = File.readlines(options[:file]).map(&:strip).join("\n")
  end

  translator = MorseCode::Translator.new
  obfuscator = MorseCode::Obfuscator.new

  morse_code = translator.translate(sentence)
  obfuscator.obfuscate(morse_code)
end
