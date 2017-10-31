require 'io_utility'

describe IOUtility, '#print' do
  context 'When called with a translation file' do
    it 'Prints the correct meessage' do
      translations =  'translations/english_us.yml'
      key = 'welcome'
      io_utility = IOUtility.new(translations)
      result = io_utility.print(key)

      expect(result).to eq "Let's play tic tac toe" 
    end
  end
end
