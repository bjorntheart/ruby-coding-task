require_relative '../src/morse_code_obfuscator.rb'

RSpec.describe MorseCodeObfuscator do
  let(:obfuscator) { MorseCodeObfuscator.new }

  it 'should obfuscate morse code string' do
    expect(obfuscator).to respond_to(:obfuscate).with(1).argument
    expect(obfuscator.obfuscate('....|.|.-..|.-..|---'))
      .to eq('4|1|1A2|1A2|C')
  end

  it 'should obfuscate a different morse code string' do
    expect(obfuscator).to respond_to(:obfuscate).with(1).argument
    expect(obfuscator.obfuscate('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'))
      .to eq('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1')
  end
end
