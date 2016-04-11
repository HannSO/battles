class Game

  attr_reader :player_1, :player_2

  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn_counter =0
  end

  def attack(player)
    player.reduce_points
     @turn_counter +=1
  end

   def player_1_turn?
     @turn_counter.even?
   end
end
