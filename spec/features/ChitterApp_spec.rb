require 'chitter'

describe Chitter do

  subject(:chitter) { described_class.new}

  describe '#init' do
    it "returns username" do
      expect(chitter.username).to eq "Mariusgg14"
    end

    it "returns a text input" do
      expect(chitter.text).to eq "I'm hungry"
    end

    it "ireturns the date" do
      expect(chitter.date).to eq "28/10/2018"
    end

    it "returns the time" do
      expect(chitter.time).to eq "22:30"
    end
    
  end

  describe '.add' do
    it 'returns added peep and see the time of peep' do
      described_class.add(nil,'I want pizza tonight ')
      described_class.add('No! I want pasta')
      described_class.add('Maybe caribbean food :)')

      peeps_test = described_class.all.first
      expect(peeps_test).to be_a Peep
      expect(peeps_test).to respond_to(:date)
      expect(peeps_test).to respond_to(:time)
    end
  end

end
