# Obfuscates morse code strings
class MorseCodeObfuscator
  def obfuscate(morse_code)
    patterns = [
      /\.{5}/,
      /\.{4}/,
      /\.{3}/,
      /\.{2}/,
      /\./,
      /\-{3}/,
      /\-{2}/,
      /\-/
    ]
    replacements = [5, 4, 3, 2, 1, 'C', 'B', 'A']
    patterns.each_with_index do |pattern, index|
      morse_code.gsub!(pattern, replacements[index].to_s)
    end
    morse_code
  end
end
