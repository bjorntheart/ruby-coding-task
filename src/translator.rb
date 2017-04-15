module MorseCode
  # Translator translates a sentence into morse code
  class Translator
    DICTIONARY = {
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
    }.freeze

    # translate sentence into morse code
    def translate(sentence)
      return '' if sentence.nil?

      unless sentence.respond_to?(:to_str)
        raise(ArgumentError, "invalid argument of type #{sentence.class}")
      end

      sentence.upcase.each_line.map do |line|
        line.split(' ').map do |word|
          word.each_char.map(&DICTIONARY).compact.join('|')
        end.join('/')
      end.join("\n")
    end
  end
end
