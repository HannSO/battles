require 'player'

describe Player do

  subject(:player) {described_class.new('rufus')}

  describe '#name' do
    it 'returns the given name' do
      expect(player.name).to eq 'rufus'
    end
  end

  describe '#points' do
    it 'returns the hit points of the player' do
      expect(player.points).to eq 60
    end
  end

  describe '#reduce_points' do
    it 'reduces the points by 10' do
      player.reduce_points
      expect{ player.reduce_points }.to change{player.points}.by(-10)
    end
  end
end
