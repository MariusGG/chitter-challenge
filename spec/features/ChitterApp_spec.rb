require 'chitter'

describe Chitter do

  subject(:chitter) { described_class.new( "hello people", "Mariusgg9", "2018-10-29", "00:16:00" )}

  describe '.add' do
    it 'returns added peep and see the time of peep' do
      described_class.new.add(nil,'I want pizza tonight ')
      described_class.new.add('No! I want pasta')
      described_class.new.add('Maybe caribbean food :)')

      peeps_test = Chitter.all.first
      expect(peeps_test).to be_a Peep
      expect(peeps_test).to respond_to(:date)
      expect(peeps_test).to respond_to(:time)
    end
  end

end
