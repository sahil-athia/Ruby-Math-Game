class Game
  attr_accessor :is_game_over
  def initialize(p1, p2)
    @turn = "Player 1"
    @is_game_over = false
    @player1 = p1
    @player2 = p2
  end
  
  def question(numbers)
    puts "#{@turn}: what is #{numbers[0]} + #{numbers[1]} equal to?"
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

  def game_over(winning_player, lives)
    @is_game_over = true
    puts "\n----- GAME OVER -----"
    puts "#{winning_player} wins with #{lives}/3 lives remaining"
    puts "goodbye"
  end

  def start 
    while !self.is_game_over
      self.reset
      numbers = [rand(20), rand(20)]
      self.question(numbers)
      answer = gets.chomp
      
      if self.check_answer(answer, numbers) == false
        @player1.lives = @player1.lives - 1
      end
    
      if @player1.lives == 0
        self.game_over("Player 2", player2.lives)
        break
      end
    
      puts "P1: #{@player1.lives}/3 P2: #{@player2.lives}/3"
      puts " \n ----- New Turn ----- \n "
    
      self.toggle_player
      numbers = [rand(20), rand(20)]
      self.question(numbers)
      answer = gets.chomp
      
      if self.check_answer(answer, numbers) == false
        @player2.lives = @player2.lives - 1
      end
    
      if @player2.lives == 0
        self.game_over("Player 1", @player1.lives)
        break
      end
    
      puts "P1: #{@player1.lives}/3 P2: #{@player2.lives}/3"
      puts "\n ----- New Turn ----- \n "
    end
  end
end