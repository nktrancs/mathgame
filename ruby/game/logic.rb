require_relative "./player"

class Game
  def initialize
    @player1 = Player.new('P1')
    @player2 = Player.new('P2')
    @players = [@player1, @player2].shuffle
    @round = 1
  end

  def next_round
    puts "-------------"
    puts "   Round##{@round}"
    puts "-------------"
    @round += 1
    @players.rotate!
    sleep 0.7
  end

  def player_turn
    @players.first
  end

  def lives_left
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def winner 
    @players.find {|player| player.lives >= 1}
  end

  def game_over
    @players.select {|player| player.loser?}.count > 0
  end

  def display_winner
    puts 
    puts "#{winner.name} wins with a remaining life of #{winner.lives}"
    puts "GAME OVER" 
  end
  
  def play
    puts "Starting game!"

    until game_over do
      answering_player = player_turn()

      next_round()

      answering_player.question

      lives_left()
    end

    display_winner()
  end

end


