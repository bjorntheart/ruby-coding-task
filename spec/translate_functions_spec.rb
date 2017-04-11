require_relative '../src/translate_functions.rb'

RSpec.describe 'Translate and obfuscate cli methods' do
  let(:file_contents) { ["HELLO\n", "I AM IN TROUBLE\n"] }
  let(:file_path) { File.join(File.dirname(__FILE__), 'test-input-file.txt') }

  it 'should translate and obfuscate a single string input' do
    expect(translate_and_obfuscate(['HELLO'])).to eq(['4|1|1A2|1A2|C'])
  end

  it 'should translate and obfuscate multiple string inputs' do
    expect(translate_and_obfuscate(['HELLO', 'I AM IN TROUBLE']))
      .to eq(['4|1|1A2|1A2|C', '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'])
  end

  it 'should translate and obfuscate inputs from file' do
    expect(File.exist?(file_path)).to be(true)
    expect(File.readlines(file_path)).to eq(file_contents)
    expect(translate_and_obfuscate(file_contents))
      .to eq(['4|1|1A2|1A2|C', '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'])
  end
end
