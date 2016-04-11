require 'game'

describe Game do

  subject(:game) {described_class.new(:player_1, :player_2)}
  let(:player_1) {double(:player_1, reduce_points: nil)}
  let(:player_2) {double(:player_2, reduce_points: nil)}

  describe '#attack' do
    it 'causes player passed in to reduce points' do
      expect(player_1).to receive(:reduce_points)
      game.attack(player_1)
    end
  end

  describe '#player_1' do
    it 'returns player_1' do
      expect(game.player_1).to eq(:player_1)
    end
  end

  describe '#player_1_turn?' do
    it 'starts as true' do
      expect(game.player_1_turn?).to eq true
    end

    it 'switches to false, after player 1 attacks' do
      game.attack(player_2)
      expect(game.player_1_turn?).to eq false
    end
  end

end
