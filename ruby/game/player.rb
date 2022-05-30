class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @lives = 3
    @name = name
  end

  def question
    val1 = rand(1..20)
    val2 = rand(1..20)

    answer = val1 + val2
    puts "#{self.name}, what is #{val1} + #{val2}?"
    player_answer = gets.chomp.to_i

    self.verify?(answer, player_answer)
  end

  def verify?(answer, player_answer)
    if answer == player_answer
      puts "Correct!"
    else
      puts "Incorrect..."
      self.lives -= 1
    end
  end

  def loser?
    self.lives <=0
  end
end