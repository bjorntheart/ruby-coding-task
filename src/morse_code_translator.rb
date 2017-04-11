# Translates lating strings to morse code
class MorseCodeTranslator
  DICTIONARY = Hash[{
    'A' => '.-',
    'B' => '-...',
    'C' => '-.-.',
    'D' => '-..',
    'E' => '.',
    'F' => '..-.',
    'G' => '--.',
    'H' => '....',
    'I' => '..',
    'J' => '.---',
    'K' => '-.-',
    'L' => '.-..',
    'M' => '--',
    'N' => '-.',
    'O' => '---',
    'P' => '.--.',
    'Q' => '--.-',
    'R' => '.-.',
    'S' => '...',
    'T' => '-',
    'U' => '..-',
    'V' => '...-',
    'W' => '.--',
    'X' => '-..-',
    'Y' => '-.--',
    'Z' => '--..',
    '1' => '.----',
    '2' => '..---',
    '3' => '...--',
    '4' => '....-',
    '5' => '.....',
    '6' => '-....',
    '7' => '--...',
    '8' => '---..',
    '9' => '----.',
    '0' => '-----',
    '.' => '.-.-.-',
    ',' => '--..--'
  }]

  def translate(latin_string)
    latin_string.strip!
    chars = latin_string.upcase.chars
    morse_code = ''

    validate_latin_string(chars, latin_string)

    chars.each_with_index do |char, index|
      if char =~ /\s/
        morse_code << '/'
        next
      end

      morse_code << DICTIONARY[char]
      morse_code << '|' if add_pipe_character?(chars, index)
    end
    morse_code
  end

  def validate_latin_string(chars, latin_string)
    valid_chars = DICTIONARY.keys + [' ']
    chars.each do |char|
      message = format('Invalid character %s detected in %s', char, latin_string)
      raise ArgumentError, message unless valid_chars.include?(char)
    end
  end

  def add_pipe_character?(chars, index)
    index_within_bounds?(chars, index) && dictionary_contain?(chars[index + 1])
  end

  def index_within_bounds?(chars, index)
    index < chars.count
  end

  def dictionary_contain?(char)
    DICTIONARY.key?(char)
  end
end
