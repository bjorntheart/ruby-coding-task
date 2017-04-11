require_relative '../src/morse_code_translator.rb'

RSpec.describe MorseCodeTranslator do
  invalid_chars = %w[
    " ' ! @ # $ % ^ & * ( ) - _ +
    = { } [ ] : ; | \ ~ `< > ? /
  ]
  hello_morse_code = '....|.|.-..|.-..|---'
  i_am_in_trouble_morse_code = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
  let(:translator) { MorseCodeTranslator.new }

  it 'returns an morse code dictionary hash' do
    dict = MorseCodeTranslator::DICTIONARY
    expect(dict).to be_a_kind_of(Hash)
    expect(dict.count).to equal(38)
  end

  it 'should have an index smaller than characters count' do
    index = 4
    chars = 'HELLO'.chars
    expect(translator).to respond_to(:index_within_bounds?).with(2).arguments
    expect(translator.index_within_bounds?(chars, index)).to be(true)
  end

  it 'should not have an index bigger than chara count' do
    index = 6
    chars = 'HELLO'.chars
    expect(translator).to respond_to(:index_within_bounds?).with(2).arguments
    expect(translator.index_within_bounds?(chars, index)).to be(false)
  end

  it 'should have a character in dictionary' do
    char = 'A'
    expect(translator).to respond_to(:dictionary_contain?).with(1).argument
    expect(translator.dictionary_contain?(char)).to be(true)
  end

  it 'should not have a character in dictionary' do
    char = ' '
    expect(translator).to respond_to(:dictionary_contain?).with(1).argument
    expect(translator.dictionary_contain?(char)).to be(false)
  end

  it 'should add pipe character to morse code string' do
    chars = 'HELLO'.chars
    expect(translator).to respond_to(:add_pipe_character?).with(2).arguments
    expect(translator.add_pipe_character?(chars, 0)).to be(true)
  end

  it 'should not add pipe character to morse code string' do
    chars = 'I AM IN TROUBLE'.chars
    expect(translator).to respond_to(:add_pipe_character?).with(2).arguments
    expect(translator.add_pipe_character?(chars, 0)).to be(false)
  end

  it 'translates a latin character string with no spaces into morse code' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate('HELLO')).to eq(hello_morse_code)
  end

  it 'translates a latin character string with spaces into morse code' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate('I AM IN TROUBLE'))
      .to eq(i_am_in_trouble_morse_code)
  end

  it 'translates a lowercase latin character string with no spaces into morse code' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate('hello')).to eq(hello_morse_code)
  end

  it 'should take exception to translate invalid characters' do
    expect(translator).to respond_to(:validate_latin_string).with(2).arguments
    invalid_chars.each do |char|
      expect { translator.validate_latin_string("HE#{char}LLO") }
        .to raise_error(ArgumentError)
    end
  end

  it 'should not have new line characters in the morse code string' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate("HELLO\n")).to eq('....|.|.-..|.-..|---')
  end

  it 'should not have trailing pipe character in the morse code string' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate('HELLO')).to_not eq('....|.|.-..|.-..|---|')
  end

  it 'should not have trailing forward slash character in the morse code string' do
    expect(translator).to respond_to(:translate).with(1).argument
    expect(translator.translate('HELLO')).to_not eq('....|.|.-..|.-..|---|/')
  end
end
