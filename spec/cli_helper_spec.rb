require_relative '../src/cli_helper.rb'

RSpec.describe 'cli_helper' do
  describe '#translate_and_obfuscate' do
    let(:file_contents) { ["HELLO\n", "I AM IN TROUBLE\n"] }
    let(:file_path) do
      File.join(File.dirname(__FILE__), 'fixtures', 'test.txt')
    end

    it 'single string input' do
      options = { text: ['HELLO'] }
      expect(translate_and_obfuscate(options)).to eq('4|1|1A2|1A2|C')
    end

    it 'multiple string input' do
      options = { text: ['HELLO', 'I AM IN TROUBLE'] }
      expect(translate_and_obfuscate(options))
        .to eq("4|1|1A2|1A2|C\n2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1")
    end

    it 'multiline file input' do
      options = { file: file_path }
      expect(File.exist?(file_path)).to be(true)
      expect(File.readlines(file_path)).to eq(file_contents)
      expect(translate_and_obfuscate(options))
        .to eq("4|1|1A2|1A2|C\n2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1")
    end
  end
end
