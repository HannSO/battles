class Game

  attr_reader :players, :turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn = player_1
    @counter = 0
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    @counter += 1
    player.receives_damage
  end

  # def who_starts_first
  #   @players.sample
  # end

  def turn
    if @counter %2 == 0
      @players[0]
    else
      @players[1]
    end
  end

end
