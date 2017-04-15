require_relative '../src/obfuscator.rb'

RSpec.describe MorseCode::Obfuscator do
  describe 'Obfuscator#obfuscate' do
    let(:obfuscator) { MorseCode::Obfuscator.new }

    it 'takes exception to non-string arguments' do
      expect { obfuscator.obfuscate(:sym) }.to raise_error(ArgumentError)
      expect { obfuscator.obfuscate([]) }.to raise_error(ArgumentError)
      expect { obfuscator.obfuscate({}) }.to raise_error(ArgumentError)
      expect { obfuscator.obfuscate(10) }.to raise_error(ArgumentError)
    end

    it 'morse code with no new lines' do
      expect(obfuscator.obfuscate('....|.|.-..|.-..|---'))
        .to eq('4|1|1A2|1A2|C')
    end

    it 'morse code with new line character' do
      morse = "....|.|.-..|.-..|---\n../.-|--/..|-./-|.-.|---|..-|-...|.-..|."
      expect(obfuscator.obfuscate(morse))
        .to eq("4|1|1A2|1A2|C\n2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1")
    end

    it 'empty string to an empty string' do
      expect(obfuscator.obfuscate('')).to eq('')
    end

    it 'nil to an empty string' do
      expect(obfuscator.obfuscate(nil)).to eq('')
    end

    it 'dots to number of dots found' do
      expect(obfuscator.obfuscate('.....')).to eq('5')
    end

    it 'dashes to alphabet letter' do
      expect(obfuscator.obfuscate('-')).to eq('A')
    end
  end
end
