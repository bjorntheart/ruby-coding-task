require_relative '../src/translator.rb'

RSpec.describe MorseCode::Translator do
  describe 'Translator#translate' do
    let(:translator) { MorseCode::Translator.new }

    it 'takes exception to non-string arguments' do
      expect { translator.translate(:sym) }.to raise_error(ArgumentError)
      expect { translator.translate([]) }.to raise_error(ArgumentError)
      expect { translator.translate({}) }.to raise_error(ArgumentError)
      expect { translator.translate(10) }.to raise_error(ArgumentError)
    end

    it 'string with no spaces' do
      expect(translator.translate('HELLO')).to eq('....|.|.-..|.-..|---')
    end

    it 'string with spaces' do
      expect(translator.translate('I AM IN TROUBLE'))
        .to eq('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.')
    end

    it 'string with new line character' do
      expect(translator.translate("HELLO\nI AM IN TROUBLE"))
        .to eq("....|.|.-..|.-..|---\n../.-|--/..|-./-|.-.|---|..-|-...|.-..|.")
    end

    it 'lowercase string' do
      expect(translator.translate('hello')).to eq('....|.|.-..|.-..|---')
    end

    it 'empty string to an empty string' do
      expect(translator.translate('')).to eq('')
    end

    it 'nil to an empty string' do
      expect(translator.translate(nil)).to eq('')
    end

    it 'strips out invalid characters and returns valid morse code' do
      invalid_chars = %w["'!@#$%^&*()-_+={}[]:;|\~`<>?/].join('')
      expect(translator.translate("HEL#{invalid_chars}LO"))
        .to eq('....|.|.-..|.-..|---')
    end
  end
end
