module MorseCode
  # Obfuscator obfuscates morse code
  class Obfuscator
    # obfuscate morse code
    def obfuscate(morse)
      return '' if morse.nil?

      unless morse.respond_to?(:to_str)
        raise(ArgumentError, "invalid argument of type #{morse.class}")
      end

      morse.gsub(/\.+/, &:size).gsub(/-+/) { |dashes| letter(dashes.size) }
    end

    # creates an alphabet array
    def alphabet
      @alphabet ||= ('A'..'Z').to_a
    end

    # finds the alphabet letter at an index
    def letter(length)
      alphabet[length - 1]
    end
  end
end
