require 'Chitter'


describe Chitter do

  describe '.all' do
    it 'returns all peeps' do
      chitters = Chitter.all
      expect(chitters).to include("Chilling at home")
      expect(chitters).to include("On my way to the pool")
      expect(chitters).to include("I want pizza!")

    end
  end


end
