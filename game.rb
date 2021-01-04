class Game
  attr_accessor :is_game_over
  def initialize
    @turn = "Player 1"
    @is_game_over = false
  end
  
  def question(numbers)
    puts "#{@turn}: what is #{numbers[0]} + #{numbers[1]}"
  end

  def check_answer(answer, numbers)
    if answer.to_i == numbers[0] + numbers[1]
      puts "#{@turn}: That is right, gj!"
    else
      puts "#{@turn}: That is wrong"
      return false
    end
  end

  def toggle_player
    @turn = (@turn == "Player 1") ? "Player 2" : "Player 1"
  end

  def reset
    @turn = "Player 1"
  end
end